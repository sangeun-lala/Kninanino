//
//  ProfileListView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/14.
//


import SwiftUI

struct ProfileListView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                HStack(alignment: .top, spacing: 12) {
                    // Profile Image Placeholder
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(.gray)

                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(user.displayName)
                                .font(.headline)
                            Text("· \(user.level)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }

                        Text(user.homebase)
                            .font(.caption)
                            .foregroundColor(.blue)

                        Text(user.bio)
                            .font(.body)
                            .lineLimit(3)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Knitting Friends")
        }
    }
}


#Preview {
    ProfileListView()
}
