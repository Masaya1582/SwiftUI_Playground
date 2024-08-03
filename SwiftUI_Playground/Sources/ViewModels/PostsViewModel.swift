//
//  PostsViewModel.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/08/03.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import Foundation
import Combine
import APIKit
import SwiftUI

final class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?

    private var cancellables = Set<AnyCancellable>()

    func fetchPosts() {
        isLoading = true
        let request = GetPostsRequest()

        Session.shared.send(request) { result in // Use Session.shared and closure
            switch result {
            case .success(let posts):
                DispatchQueue.main.async { // Ensure UI updates on main thread
                    self.posts = posts
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                }
            }
            DispatchQueue.main.async { // Always update loading state on main thread
                self.isLoading = false
            }
        }
    }
}
