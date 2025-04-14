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
              let data = try? Data(contentsOf: url) else {
            print("❌ Failed to load MockUsers.json")
            return []
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let decoded = try decoder.decode([AppUser].self, from: data)
            return decoded
        } catch {
            print("❌ Failed to decode MockUsers.json: \(error)")
            return []
        }
        
    }
}
