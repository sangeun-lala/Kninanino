//
//  Project.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/08.
//
// Represents the knitting project itself - the overarching container that holds related journal entries, pattern info, etc.


import Foundation

struct Project: Identifiable, Codable {
    let id: String
    let userId: String
    let title: String              // e.g., "Ranunculus Sweater"
    let patternName: String       // Optional: reuse `title` if same
    let yarnUsed: String?         // Optional
    let startDate: Date
    let endDate: Date?            // Optional
    let notes: String?            // Optional notes about the project
    let rating: String?
    let needle: String?
    let color: String?
    let gaugeSwatches: [GaugeSwatch]
}
