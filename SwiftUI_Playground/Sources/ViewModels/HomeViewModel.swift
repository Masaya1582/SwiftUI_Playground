// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Combine

class HomeViewModel: ObservableObject {
    @Published var numbers: [Int] = [1, 2, 3, 4, 5]
    @Published var squaredNumbers: [Int] = []

    private var cancellables: Set<AnyCancellable> = []

    func squareNumbers() {
        numbers.publisher
            .map { $0 * $0 }
            .collect()
            .sink(receiveValue: { [weak self] squaredNumbers in
                self?.squaredNumbers = squaredNumbers
            })
            .store(in: &cancellables)
    }
}
