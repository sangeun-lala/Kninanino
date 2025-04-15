//
//  ProjectJournal.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/15.
//

import Foundation

struct ProjectJournal: Identifiable, Codable {
    let id: String
    let projectId: String          // <-- Link to a Project
    let userId: String             // <-- Link to a User
    let entryDate: Date
    let location: String
    let journalEntry: String
    let photos: [String]?          // Optional: image filenames or URLs
}
