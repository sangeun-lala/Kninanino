//
//  ProfileDataProvider.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/05/07.
//

import Foundation

protocol ProfileDataProvider {
    func fetchProjects(for userId: String) -> [Project]
    func fetchJournals(for userId: String) -> [ProjectJournal]
}
