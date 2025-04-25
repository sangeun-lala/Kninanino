//
//  User.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/08.
//

import Foundation
import FirebaseFirestore

struct AppUser: Identifiable, Codable, Equatable {
    @DocumentID var id: String?
    let email: String
    var username: String
    var displayName: String
    var level: String  // "Beginner", "Expert", "Advanced"
    var bio: String?
    var homebase: String?
    var profilePictureURL: String?
    var dateJoined: Date
    var followersCount: Int
    var followingCount: Int
}

//need to update the users.md


