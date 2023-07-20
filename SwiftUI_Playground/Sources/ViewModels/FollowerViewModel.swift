// 
//  FollowerViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class FollowerViewModel: ObservableObject {
    @Published var followers = [Follower]()

    func fetchFollowers() async {
        guard let url = URL(string: "https://api.github.com/users/Masaya1582/followers?per_page=10") else {
            fatalError("URL not found")
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            self.followers = try JSONDecoder().decode([Follower].self, from: data)
        } catch {
            print("Error decoding data: \(error)")
        }
    }
}
