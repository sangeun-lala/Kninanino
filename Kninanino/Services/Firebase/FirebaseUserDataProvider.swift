//
//  FirebaseUserDataProvider.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/14.
//

// Services/Firebase/FirebaseUserDataProvider.swift

import Foundation
import Firebase

struct FirebaseUserDataProvider: UserDataProvider {
    func fetchUsers() async throws -> [AppUser] {
        // TODO: implement with Firestore
        return []
    }

    func saveUser(_ user: AppUser) async throws {
        // TODO: save to Firestore
    }
}
