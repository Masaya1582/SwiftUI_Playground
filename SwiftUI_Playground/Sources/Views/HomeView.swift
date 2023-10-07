//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var posts: [Post] = []
    @State private var isLoading = false

    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationBarTitle("Posts")
            .onAppear {
                if posts.isEmpty {
                    fetchPosts()
                }
            }
            .overlay(
                isLoading ? ProgressView("Loading...") : nil
            )
        }
    }

    private func fetchPosts() {
        isLoading = true
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            isLoading = false
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            defer { isLoading = false }
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        self.posts = decodedData
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }
        task.resume()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
