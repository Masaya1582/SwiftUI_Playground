// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var name = ""
    @Published var age = 24
    @Published var height = 174.5
    @Published var shouldInvertColor = false
    @Published var isFloatingViewVisible = false
    @Published var posts: [Post] = []

    init() {
        fetchPosts()
    }

    private func fetchPosts() {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
            URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: [Post].self, decoder: JSONDecoder())
                .replaceError(with: [])
                .receive(on: DispatchQueue.main)
                .assign(to: &$posts)
        }
    }

}
