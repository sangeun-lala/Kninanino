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
                }
                .tag(0)

            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)

            NewJournalView()
                .tabItem {
                    Image(systemName: "plus.circle")
                }
                .tag(2)

            NotificationsView()
                .tabItem {
                    Image(systemName: "bell")
                }
                .tag(3)

            MyProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(4)
        }
    }
}
