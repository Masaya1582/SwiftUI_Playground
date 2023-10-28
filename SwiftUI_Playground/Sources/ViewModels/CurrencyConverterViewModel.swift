// 
//  CurrencyConverterViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class CurrencyConverterViewModel: ObservableObject {
    private var converter = CurrencyConverter()
    @Published var usdAmount: String = ""
    @Published var euroAmount: String = ""

    private var cancellables = Set<AnyCancellable>()

    init() {
        $usdAmount
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { Double($0) ?? 0.0 }
            .map { self.converter.convertUSDToEuro(usdAmount: $0) }
            .map { String(format: "%.2f", $0) }
            .assign(to: \.euroAmount, on: self)
            .store(in: &cancellables)
    }
}
