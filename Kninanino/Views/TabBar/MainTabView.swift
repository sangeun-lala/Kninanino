//
//  MainTabView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/10.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0 //control which tab is selected
    
    //Add a temporary, mock currentUser before implementing the actual currentUser.
    let currentUser = AppUser(
        id: UUID().uuidString,  // ✅ convert UUID to String
        username: "mockknitter",
        displayName: "Mock Knitter",
        level: "Beginner",
        bio: "I love knitting in cafés.",
        homebase: "London",
        profilePictureURL: nil,
        dateJoined: Date(),
        followersCount: 0,
        followingCount: 0
        )
    
    var body: some View {
        TabView (selection: $selectedTab){
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)

            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)

            NewJournalView(currentUserID: currentUser.id ?? "")
                .tabItem {
                    Image(systemName: "plus.circle")
                }
                .tag(2)

            NotificationsView()
                .tabItem {
                    Image(systemName: "bell")
                }
                .tag(3)

            ProfileView(user: currentUser, isCurrentUser: true)
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(4)
        }
    }
}
