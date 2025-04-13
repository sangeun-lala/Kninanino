//
//  User.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/08.
//

import Foundation

struct AppUser: Identifiable, Codable {
    let id: UUID
    let username: String
    let displayName: String
    let level: String  // "Beginner", "Expert", "Advanced"
    let profilePictureURL: String?  // Optional mock image
    let bio: String
    let homebase: String // The city where the user is based
}
