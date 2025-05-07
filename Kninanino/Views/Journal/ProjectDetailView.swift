//
//  ProjectDetailView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/05/01.
//

import SwiftUI

struct ProjectDetailView: View {
    var project: Project

    // Mock Data
    let imageURLs = [
        "https://example.com/image1.jpg",
        "https://example.com/image2.jpg"
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Scrollable image viewer
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(imageURLs, id: \.self) { url in
                            AsyncImage(url: URL(string: url)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 250, height: 250)
                            .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                }

                // Metadata
                VStack(alignment: .leading, spacing: 8) {
                    Text("Pattern: Ranunculus")
                    Text("Yarn: Sandnes Garn")
                    Text("Needles: 4.5mm")
                }
                .font(.subheadline)
                .padding()

                Divider()

                // Comments placeholder
                VStack(alignment: .leading, spacing: 8) {
                    Text("Comments")
                        .font(.headline)

                    ForEach(0..<3) { _ in
                        Text("This is a lovely project!")
                            .padding(8)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
        .navigationTitle(project.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
