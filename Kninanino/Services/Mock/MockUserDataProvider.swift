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
            id: UUID(),
            username: "mockknitter",
            displayName: "Mock Knitter",
            level: "Beginner",
            profilePictureURL: nil,
            bio: "I love knitting in cafés.",
            homebase: "London",
            dateJoined: Date()
        )
    ]

    func fetchUsers() async throws -> [AppUser] {
        return mockUsers
    }

    func saveUser(_ user: AppUser) async throws {
        print("Mock save: \(user)")
    }
}
