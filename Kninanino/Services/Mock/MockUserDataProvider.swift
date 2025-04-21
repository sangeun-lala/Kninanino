//
//  MockUserDataProvider.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/14.
//

import Foundation

struct MockUserDataProvider: UserDataProvider {
    private var mockUsers: [AppUser] = [
        AppUser(
            id: UUID().uuidString,  // ✅ convert UUID to String
            email: "mockmock@knina.com",
            username: "mockknitter",
            displayName: "Mock Knitter",
            level: "Beginner",
            bio: "I love knitting in cafés.",
            homebase: "London",
            profilePictureURL: nil,
            dateJoined: Date(),
            followersCount: 0,
            followingCount: 0
        )
    ]

    func fetchUsers() async throws -> [AppUser] {
        return mockUsers
    }

    func saveUser(_ user: AppUser) async throws {
        print("Mock save: \(user)")
    }
}
