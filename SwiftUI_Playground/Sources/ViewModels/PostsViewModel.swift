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
    private let repository: PostRepositoryProtocol

    init(repository: PostRepositoryProtocol = PostRepository()) {
        self.repository = repository
    }

    func fetchPosts(postId: Int) {
        isLoading = true

        repository.fetchPost(postId: postId)
            .receive(on: DispatchQueue.main) // Receive values on the main thread for UI updates
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    self.error = error
                case .finished:
                    break // No action needed upon successful completion
                }
            }, receiveValue: { post in
                self.posts = [post] // Assuming you want to display a single post
            })
            .store(in: &cancellables)
    }
}
