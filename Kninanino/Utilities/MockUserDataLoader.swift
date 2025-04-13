//
//  MockUserDataLoader.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/13.
//

import Foundation

class MockUserDataLoader {
    static func loadUsers() -> [AppUser] {
        guard let url = Bundle.main.url(forResource: "MockUsers", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([AppUser].self, from: data)
        else {
            print("❌ Failed to load or decode MockUsers.json")
            return []
        }
        return decoded
    }
}
