// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []

    func fetchPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else { return }

            do {
                let decoder = JSONDecoder()
                let decodedPosts = try decoder.decode([Post].self, from: data)

                DispatchQueue.main.async {
                    self.posts = decodedPosts
                }
            } catch {
                print("Error decoding posts: \(error)")
            }
        }
        task.resume()
    }
}
