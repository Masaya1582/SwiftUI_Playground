//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit
import Combine

struct HomeView: View {
    @State private var sliderValue: Double = 0.0
    private var sliderValuePublisher = PassthroughSubject<Double, Never>()
    private var formattedSliderValue: String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: sliderValue)) ?? "0"
    }

    var body: some View {
        VStack {
            Slider(value: $sliderValue, in: 0...100, step: 1.0)
                .padding()

            Text("Slider Value: \(formattedSliderValue)")
                .modifier(CustomLabel(foregroundColor: .black, size: 28))
                .onReceive(sliderValuePublisher) { value in
                    self.sliderValue = value
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
