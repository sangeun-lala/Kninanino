//
//  Project.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/08.
//
// Represents the knitting project itself - the overarching container that holds related journal entries, pattern info, etc.


import Foundation
import FirebaseFirestore

struct Project: Identifiable, Codable {
    @DocumentID var id: String?
    var userId: String
    var title: String              // e.g., "Ranunculus Sweater"
    var patternId: String?
    var yarnId: String?         // Optional
    var startDate: Date
    var endDate: Date?            // Optional
    var notes: String?            // Optional notes about the project
    var rating: Double?          // Difficulty rating
    var needle: String?
    var color: String?
    var gaugeSwatches: [GaugeSwatch]
}

