//
//  MockProfileDataProvider.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/05/07.
//

import Foundation

class MockProfileDataProvider: ProfileDataProvider {
    func fetchProjects(for userId: String) -> [Project] {
        return MockData.lalaProjects.filter { $0.userId == userId }
    }
    
    func fetchJournals(for userId: String) -> [ProjectJournal] {
        return MockData.lalaJournals.filter { $0.userId == userId }
    }
}
