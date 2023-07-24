// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Combine

class HomeViewModel: ObservableObject {
    @Published var strings: [String] = ["1", "2", "3", "4", "5"]
    @Published var integers: [Int] = []

    private var cancellables: Set<AnyCancellable> = []

    func convertToIntegers() {
        strings.publisher
            .compactMap { Int($0) }
            .collect()
            .sink(receiveValue: { [weak self] integers in
                self?.integers = integers
            })
            .store(in: &cancellables)
    }
}
