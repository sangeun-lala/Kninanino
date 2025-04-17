//
//  ProjectJournal.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/15.
//

import Foundation
import FirebaseFirestore

struct ProjectJournal: Identifiable, Codable {
    @DocumentID var id: String?
    var projectId: String          // <-- Link to a Project
    var userId: String             // <-- Link to a User
    var entryDate: Date
    var locationId: String?
    var journalEntry: String
    var photos: [String]?          // Optional: image filenames or URLs
    var likesCount: Int
    var commentsCount: Int
}
