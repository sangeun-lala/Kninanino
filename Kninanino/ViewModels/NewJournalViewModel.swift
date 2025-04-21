//
//  NewJournalViewModel.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/09.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import PhotosUI
import SwiftUI

class NewJournalViewModel: ObservableObject {
    @Published var projectId: String = ""
    @Published var userId: String = ""
    @Published var entryDate: Date = Date()
    @Published var locationId: String? = nil
    @Published var journalEntry: String = ""
    @Published var photos: [String] = []
    @Published var selectedPhotoItems: [PhotosPickerItem] = [] {
        didSet {
            loadImagesFromPicker()
        }
    }
    @Published var selectedImages: [UIImage] = []
    
    @Published var isSaving: Bool = false
    @Published var errorMessage: String?
    
    @Published var useExistingProject: Bool = true
    @Published var userProjects: [Project] = []
    @Published var selectedProjectId: String?
    @Published var newProjectTitle: String = ""
    @Published var newProjectPattern: String = ""
    @Published var newProjectYarn: String = ""
    
    
    // Fetch existing projects
    func fetchProjects(for userId: String) {
        Firestore.firestore().collection("projects")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Error fetching projects: \(error.localizedDescription)")
                    return
                }
                self.userProjects = snapshot?.documents.compactMap {
                    try? $0.data(as: Project.self)
                } ?? []
            }
    }
    
    
    private func loadImagesFromPicker() {
        selectedImages = []
        for item in selectedPhotoItems {
            Task {
                if let data = try? await item.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    await MainActor.run {
                        self.selectedImages.append(uiImage)
                    }
                }
            }
        }
    }
    
    
    func addJournal(for userId: String) {
        isSaving = true
        errorMessage = nil
        let db = Firestore.firestore()
        let journalId = UUID().uuidString
        let entryDate = Date()
        var projectIdToUse = selectedProjectId ?? ""
        
        if !useExistingProject {
            let newProject = Project(
                id: UUID().uuidString,
                userId: userId,
                title: newProjectTitle,
                patternId: nil,                          // or newProjectPattern if you adapt types
                yarnId: nil,
                startDate: Date(),
                endDate: nil,
                notes: nil,
                rating: nil,
                needle: nil,
                color: nil,
                gaugeSwatches: []                        // assuming no swatch data yet
            )
            do {
                try Firestore.firestore().collection("projects").document(newProject.id!).setData(from: newProject)
                projectIdToUse = newProject.id!
            } catch {
                print("❌ Failed to create new project: \(error.localizedDescription)")
                return
            }
        }
        
        // First upload images if any
        Task {
            var photoURLs: [String] = []
            
            for (index, image) in selectedImages.enumerated() {
                if let data = image.jpegData(compressionQuality: 0.8) {
                    let filename = "\(journalId)_\(index).jpg"
                    let ref = Storage.storage().reference().child("journalPhotos/\(filename)")
                    
                    do {
                        _ = try await ref.putDataAsync(data)
                        let url = try await ref.downloadURL()
                        photoURLs.append(url.absoluteString)
                    } catch {
                        print("Image upload failed: \(error.localizedDescription)")
                    }
                }
            }
            
            let newJournal = ProjectJournal(
                id: nil,
                projectId: projectId,
                userId: userId,
                entryDate: entryDate,
                locationId: locationId,
                journalEntry: journalEntry,
                photos: photos.isEmpty ? nil : photos,
                likesCount: 0,
                commentsCount: 0
            )
            
            do {
                _ = try db.collection("Journals").addDocument(from: newJournal) { error in
                    DispatchQueue.main.async {
                        self.isSaving = false
                        if let error = error {
                            self.errorMessage = "Failed to save journal: \(error.localizedDescription)"
                        } else {
                            print("Project journal saved ✅")
                            // Optionally reset form fields
                            self.journalEntry = ""
                            self.photos = []
                        }
                    }
                }
            } catch {
                self.isSaving = false
                self.errorMessage = "Unexpected error: \(error.localizedDescription)"
            }
        }
    }
}
