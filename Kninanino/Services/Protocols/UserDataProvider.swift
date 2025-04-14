//
//  UserDataProvider.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/14.
//

import Foundation

protocol UserDataProvider {
    func fetchUsers() async throws -> [AppUser]
    func saveUser(_ user: AppUser) async throws
}
