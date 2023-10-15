//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: PostViewModel

    var body: some View {
        NavigationView {
            List(viewModel.posts, id: \.id) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.subheadline)
                }
            }
            .navigationBarTitle("Posts")
        }
        .onAppear {
            Task {
                await viewModel.fetchPosts()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
                .environmentObject(PostViewModel())
            HomeView()
                .preferredColorScheme(.dark)
                .environmentObject(PostViewModel())
        }
    }
}
