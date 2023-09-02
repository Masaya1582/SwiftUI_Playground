// 
//  PostViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []

    func fetchData(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            completion()
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Post].self, from: data) {
                    DispatchQueue.main.async {
                        self.posts = decodedResponse
                        completion()
                    }
                    return
                }
            }
            completion()
        }.resume()
    }
}
