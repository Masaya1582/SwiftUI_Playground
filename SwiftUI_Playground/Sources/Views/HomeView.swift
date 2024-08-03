//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = PostsViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
            } else if let post = viewModel.posts.first { // Or use viewModel.post if it's a single post
                Text(post.title)
                    .font(.headline)
                Text(post.body)
                    .font(.subheadline)
            }
        }
        .onAppear {
            viewModel.fetchPosts(postId: 1) // Fetch a post when the view appears
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
