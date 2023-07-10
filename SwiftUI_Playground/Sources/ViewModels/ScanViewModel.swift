// 
//  ScanViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class ScanViewModel: ObservableObject {
    @Published var scanResult: [Int] = []
    private var cancellables = Set<AnyCancellable>()

    func performScan() {
        let publisher = [1, 2, 3, 4, 5].publisher

        publisher.scan(0, +)
            .collect()
            .sink { [weak self] values in
                self?.scanResult = values
            }
            .store(in: &cancellables)
    }
}
