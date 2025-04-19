//
//  ProfileView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/10.
//

import SwiftUI

struct MyProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        if let user = authViewModel.currentUser {
            ScrollView {
                VStack(spacing:16) {
                    headerSection(for: user)
                    statsSection
                    filterBar
                    projectGallery
                }
                .padding()
            }
            .navigationTitle(user.displayName)
            .navigationBarTitleDisplayMode(.inline)
        } else {
            ProgressView("Loading profile..")
        }
    }
    
    
    func headerSection(for user: AppUser) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Button ("Edit Profile"){
                    // show edit form
                }
            }
            
            Text(user.bio ?? "No bio available")
                .font(.body)
        }
    }
    
    var statsSection: some View {
        HStack {
            VStack {
                Text("12")
                    .font(.headline)
                Text("Completed")
                    .font(.caption)
            }
            VStack {
                Text("3")
                    .font(.headline)
                Text("WIPs")
                    .font(.caption)
            }
            VStack {
                Text("21")
                    .font(.headline)
                Text("Comments")
                    .font(.caption)
            }
            // Add favorited / queued if needed
        }
    }
    
    var filterBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button("All") { /* Filter action */ }
                Button("WIPs") { /* Filter action */ }
                Button("Completed") { /* Filter action */ }
                Button("Queued") { /* Filter action */ }
            }
            .padding(.vertical, 4)
        }
    }
    
    var projectGallery: some View {
        Text("Project thumbnails here or empty state.")
            .foregroundColor(.secondary)
    }
    
}
