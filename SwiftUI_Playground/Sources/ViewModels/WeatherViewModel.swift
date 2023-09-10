// 
//  WeatherViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {
    @Published var temperature: String = ""
    @Published var humidity: String = ""

    private var cancellables: Set<AnyCancellable> = []

    init() {
        // Simulate fetching temperature and humidity data
        fetchData()
    }

    func fetchData() {
        Timer.publish(every: 5, on: .main, in: .common)
            .autoconnect()
            .map { _ in String(format: "%.2f", Double.random(in: 20...30)) }
            .sink(receiveValue: { [weak self] temperature in
                self?.temperature = temperature
            })
            .store(in: &cancellables)

        Timer.publish(every: 3, on: .main, in: .common)
            .autoconnect()
            .map { _ in String(format: "%.2f", Double.random(in: 40...60)) }
            .sink(receiveValue: { [weak self] humidity in
                self?.humidity = humidity
            })
            .store(in: &cancellables)
    }
}
