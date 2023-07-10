// 
//  ZipViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class ZipViewModel: ObservableObject {
    @Published var zipResult: [(Int, String)] = []
    private var cancellables = Set<AnyCancellable>()

    func performZip() {
        let publisher1 = [1, 2, 3].publisher
        let publisher2 = ["A", "B", "C"].publisher

        Publishers.Zip(publisher1, publisher2)
            .collect()
            .sink { [weak self] values in
                self?.zipResult = values
            }
            .store(in: &cancellables)
    }
}
