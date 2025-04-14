//
//  ProfileViewModel.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/13.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    private let userProvider: UserDataProvider
    
    @Published var users: [AppUser] = []

    init(userProvider: UserDataProvider = isUsingMockData ? MockUserDataProvider() : FirebaseUserDataProvider()) {
        self.userProvider = userProvider
        Task {
            await loadUsers()
        }
    }
    
    func loadUsers() async {
        do {
            let result = try await userProvider.fetchUsers()
            DispatchQueue.main.sync {
                self.users = result
            }
        } catch {
            print("Error fetching users: \(error)")
        }
    
    }
}
