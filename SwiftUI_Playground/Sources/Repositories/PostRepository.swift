//
//  PostRepository.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/08/03.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import APIKit
import SwiftUI
import Combine

protocol PostRepositoryProtocol {
    func fetchPost(postId: Int) -> AnyPublisher<Post, Error>
}

final class PostRepository: PostRepositoryProtocol {
    func fetchPost(postId: Int) -> AnyPublisher<Post, any Error> {
        let request = GETRequest<Post>(
            baseURL: URL(string: "https://jsonplaceholder.typicode.com")!,
            path: "/posts/\(postId)"
        )

        return Future<Post, Error> { promise in
            Session.shared.send(request) { result in
                switch result {
                case .success(let post):
                    promise(.success(post))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
