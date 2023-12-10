//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    // 1. Define the layout for the image grid
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]

    // 2. Define a list of 50 placeholder image URLs from Unsplash
    private let imageUrls: [String] = (1...50).map { index in
        "https://source.unsplash.com/random/\(300 + index)x\(300 + index)"
    }

    var body: some View {
        // 3. Create a ScrollView to enable scrolling through the grid
        ScrollView {
            // 4. Use LazyVGrid to create a flexible grid layout
            LazyVGrid(columns: columns, spacing: 2) {
                // 5. Loop through the image URLs to create Image views
                ForEach(imageUrls, id: \.self) { imageUrl in
                    // 6. Use AsyncImage to load and display images from URLs
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        // 7. Display the loaded image with content mode fill
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                    } placeholder: {
                        // 8. Display a placeholder while the image is loading
                        ProgressView()
                    }
                }
            }
        }
        .navigationTitle("Feed")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
