//
//  MockDataSource.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/10/31.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import Foundation
import Combine

class MockDataSource {
    static func fetchFriends() -> AnyPublisher<[Friend], Error> {
        let friends = [
            Friend(name: "Alice", age: 30),
            Friend(name: "Bob", age: 25),
            Friend(name: "Charlie", age: 35),
            Friend(name: "David", age: 28)
        ]
        return Just(friends)
            .setFailureType(to: Error.self)
            .delay(for: .seconds(1), scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
