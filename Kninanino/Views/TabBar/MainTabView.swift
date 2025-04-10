//
//  MainTabView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/10.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0 //control which tab is selected
    
    var body: some View {
        TabView (selection: $selectedTab){
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                    //Label("Home", systemImage: "house")
                }
                .tag(0)

            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                    //Label("Explore", systemImage: "magnifyingglass")
                }
                .tag(1)

            NewJournalView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Add")
                    //Label("Add", systemImage: "plus.circle")
                }
                .tag(2)

            NotificationsView()
                .tabItem {
                    Image(systemName: "bell")
                    Text("Notifications")
                    //Label("Notifications", systemImage: "bell")
                }
                .tag(3)

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                    //Label("Profile", systemImage: "person")
                }
                .tag(4)
        }
    }
}
