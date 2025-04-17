//
//  NewJournalViewModel.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/09.
//

import Foundation
import FirebaseFirestore


class NewJournalViewModel: ObservableObject {
    @Published var projectId: String = ""
    @Published var userId: String = ""
    @Published var entryDate: Date = Date()
    @Published var locationId: String? = nil
    @Published var journalEntry: String = ""
    @Published var photos: [String] = []
    
    @Published var isSaving: Bool = false
    @Published var errorMessage: String?

    func addJournal(for userId: String) {
        isSaving = true
        errorMessage = nil

        let db = Firestore.firestore()
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
