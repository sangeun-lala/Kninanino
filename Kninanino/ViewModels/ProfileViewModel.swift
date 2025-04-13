//
//  ProfileViewModel.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/13.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var users: [AppUser] = []

    init(useMock: Bool = true) {
        if useMock {
            users = MockUserDataLoader.loadUsers()
        } else {
            // TODO: Load from Firestore or remote DB
        }
    }
}
