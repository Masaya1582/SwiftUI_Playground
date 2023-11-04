//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var redValue: Double = 0.5
    @State private var greenValue: Double = 0.5
    @State private var blueValue: Double = 0.5

    var body: some View {
        VStack {
            ColorSquare(red: redValue, green: greenValue, blue: blueValue)

            Slider(value: $redValue, in: 0...1, step: 0.01)
                .padding()
            Text("Red: \(redValue, specifier: "%.2f")")
                .modifier(CustomLabel(foregroundColor: .black, size: 20))

            Slider(value: $greenValue, in: 0...1, step: 0.01)
                .padding()
            Text("Green: \(greenValue, specifier: "%.2f")")
                .modifier(CustomLabel(foregroundColor: .black, size: 20))

            Slider(value: $blueValue, in: 0...1, step: 0.01)
                .padding()
            Text("Blue: \(blueValue, specifier: "%.2f")")
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
        }
    }
}

struct ColorSquare: View {
    var red: Double
    var green: Double
    var blue: Double

    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200)
            .cornerRadius(10)
            .foregroundColor(Color(red: red, green: green, blue: blue))
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
