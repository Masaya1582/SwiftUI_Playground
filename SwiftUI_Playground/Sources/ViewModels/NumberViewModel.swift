// 
//  NumberViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class NumberViewModel: ObservableObject {
    @Published var firstNumber = ""
    @Published var secondNumber = ""

    private var cancellables = Set<AnyCancellable>()

    @Published var sum = ""

    init() {
        // Combine the latest values of firstNumber and secondNumber and calculate the sum
        Publishers.CombineLatest($firstNumber, $secondNumber)
            .map { (first, second) -> Int in
                guard let firstValue = Int(first), let secondValue = Int(second) else {
                    return 0
                }
                return firstValue + secondValue
            }
            .map { String($0) }
            .assign(to: \.sum, on: self)
            .store(in: &cancellables)
    }
}
