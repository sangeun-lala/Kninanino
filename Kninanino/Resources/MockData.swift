//
//  MockData.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/30.
//

import Foundation

struct MockData {
    static let lalaUser = AppUser(
        id: "ntH6xPycfrS1tE9XOmnVWGei6k43",  // Replace this with the actual Firebase UID
        email: "test@kninanino.com",
        username: "lala_knits",
        displayName: "Lala",
        level: "Beginner",
        bio: "Knitting enthusiast who loves cozy sweaters.",
        homebase: "London",
        profilePictureURL: nil,
        dateJoined: Date(),  // Or you can manually set an earlier date
        followersCount: 12,
        followingCount: 8
    )
    
    static let lalaProjects: [Project] = [
        Project(
            id: "project1",
            userId: "ntH6xPycfrS1tE9XOmnVWGei6k43",
            title: "Ranunculus Sweater",
            patternId: nil,
            yarnId: nil,
            startDate: Date(),
            endDate: nil,
            notes: "First big sweater project!",
            rating: 3.5,
            needle: "4.5mm",
            color: "Cream",
            gaugeSwatches: []
        ),
        Project(
            id: "project2",
            userId: "ntH6xPycfrS1tE9XOmnVWGei6k43",
            title: "Baby Suit",
            patternId: nil,
            yarnId: nil,
            startDate: Date(),
            endDate: nil,
            notes: "Gift for my friend's baby!",
            rating: 2.0,
            needle: "2.5mm",
            color: "Navy",
            gaugeSwatches: []
        )
    ]
    
    static let lalaJournals: [ProjectJournal] = [
        ProjectJournal(
            id: "journal1",
            projectId: "project1",
            userId: "ntH6xPycfrS1tE9XOmnVWGei6k43",
            entryDate: Date(),
            locationId: nil,
            journalEntry: "Made good progress on the yoke today!",
            photos: ["startranunculus"],
            likesCount: 2,
            commentsCount: 3
        ),
        ProjectJournal(
            id: "journal2",
            projectId: "project2",
            userId: "ntH6xPycfrS1tE9XOmnVWGei6k43",
            entryDate: Date(),
            locationId: nil,
            journalEntry: "Cast on baby suit for friend!",
            photos: ["startbabysuit"],
            likesCount: 8,
            commentsCount: 1
        )
    ]
}
