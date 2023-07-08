//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var fahrenheit = 32.0

    private let minValue = 32.0
    private let maxValue = 570.0

    private let gradient = Gradient(colors: [.green, .orange, .pink])

    var body: some View {
        VStack {
            Gauge(value: fahrenheit, in: minValue...maxValue) {
                Label("Temperature (°F)", systemImage: "thermometer.medium")
            } currentValueLabel: {
                Text(Int(fahrenheit), format: .number)
                    .foregroundColor(.green)
            } minimumValueLabel: {
                Text("32")
                    .foregroundColor(.blue)
            } maximumValueLabel: {
                Text("570")
                    .foregroundColor(.pink)
            }
            .tint(gradient)
            Gauge(value: fahrenheit, in: minValue...maxValue) {
                Label("Temperature (°F)", systemImage: "thermometer.medium")
            }
            .tint(.pink)
            Slider(value: $fahrenheit, in: minValue...maxValue)
        }
        .gaugeStyle(.accessoryCircular)
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
