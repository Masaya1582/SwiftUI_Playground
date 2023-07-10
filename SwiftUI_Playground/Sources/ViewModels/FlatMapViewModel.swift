// 
//  FlatMapViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

struct Item {
    let values: [Int]
}

class FlatMapViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    @Published var flatMapResult: Int = 0

    func performFlatMap() {
        let items = [
            Item(values: [1, 2, 3]),
            Item(values: [4, 5]),
            Item(values: [6, 7, 8])
        ]

        items.publisher
            .flatMap { $0.values.publisher }
            .sink { value in
                self.flatMapResult = value
                print(value) // Output: 1, 2, 3, 4, 5, 6, 7, 8
            }
            .store(in: &cancellables)
    }
}
