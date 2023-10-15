// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []

    func fetchPosts() async {
        do {
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                self.posts = decodedPosts
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}
