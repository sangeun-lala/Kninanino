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
import FirebaseAuth

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
                do {
                    if let data = try await item.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        await MainActor.run {
                            self.selectedImages.append(uiImage)
                            print("✅ Image loaded and converted to UIImage")
                        }
                    } else {
                        print("❌ Failed to load image data or convert to UIImage")
                    }
                } catch {
                    print("❌ Error loading image: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    func addJournal() {
        
        guard let authUserId = Auth.auth().currentUser?.uid else {
            print("❌ No authenticated user found.")
            self.errorMessage = "You must be logged in to add a journal."
            return
        }
        
        Task {
            print("🆔 Using Auth UID for journal: \(authUserId)")
    
            await MainActor.run {
                self.isSaving = true
                self.errorMessage = nil
            }
            
            let db = Firestore.firestore()
            let userId = authUserId
            let journalId = UUID().uuidString
            let entryDate = Date()
            var projectIdToUse = selectedProjectId ?? ""
            
            // Step 1: Create a new project if needed
            if !useExistingProject {
                let newProject = Project(
                    id: UUID().uuidString,
                    userId: userId,
                    title: newProjectTitle,
                    patternId: nil,
                    yarnId: nil,
                    startDate: Date(),
                    endDate: nil,
                    notes: nil,
                    rating: nil,
                    needle: nil,
                    color: nil,
                    gaugeSwatches: []
                )
                do {
                    try Firestore.firestore().collection("projects").document(newProject.id!).setData(from: newProject)
                    projectIdToUse = newProject.id!
                } catch {
                    print("❌ Failed to create new project: \(error.localizedDescription)")
                    await MainActor.run {
                        self.errorMessage = "Failed to create project"
                        self.isSaving = false
                    }
                    return
                }
            }
            
            // Step 2: Upload images (if any)
            var photoURLs: [String] = []
            
            for (index, image) in selectedImages.enumerated() {
                if let data = image.jpegData(compressionQuality: 0.8) {
                    let filename = "\(journalId)_\(index).jpg"
                    let ref = Storage.storage().reference().child("users/\(userId)/journalPhotos/\(filename)")
                    
                    do {
                        print("⬆️ Uploading image \(filename)...")
                        _ = try await ref.putDataAsync(data)
                        let url = try await ref.downloadURL()
                        print("✅ Uploaded and got URL: \(url)")
                        photoURLs.append(url.absoluteString)
                    } catch {
                        print("❌ Image upload failed: \(error.localizedDescription)")
                    }
                } else {
                    print("❌ Failed to convert image at index \(index) to JPEG")
                }
            }
            
            // Step 3: Stop if image upload failed but images were selected
            if !selectedImages.isEmpty && photoURLs.isEmpty {
                await MainActor.run {
                    self.errorMessage = "Image upload failed"
                    self.isSaving = false
                }
                return
            }
            
            // Step 4: Save the journal entry
            let newJournal = ProjectJournal(
                id: nil,
                projectId: projectIdToUse,
                userId: userId,
                entryDate: entryDate,
                locationId: locationId,
                journalEntry: journalEntry,
                photos: photoURLs.isEmpty ? nil : photoURLs,
                likesCount: 0,
                commentsCount: 0
            )
            
            do {
                _ = try db.collection("journals").addDocument(from: newJournal) { error in
                    Task { @MainActor in
                        self.isSaving = false
                        if let error = error {
                            self.errorMessage = "Failed to save journal: \(error.localizedDescription)"
                        } else {
                            print("✅ Project journal saved")
                            self.journalEntry = ""
                            self.photos = []
                            self.selectedImages = []
                            self.selectedPhotoItems = []
                        }
                    }
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = "Unexpected error: \(error.localizedDescription)"
                    self.isSaving = false
                }
            }
        }
    }
    
}
