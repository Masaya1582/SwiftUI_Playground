//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var speed = 50.0

    var body: some View {
        VStack {
            Slider(value: $speed, in: 0...250) {
                Text("Speed")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("250")
            }

            Gauge(value: speed, in: 0...250) {
                Text("Speed")
            } currentValueLabel: {
                Text(Int(speed), format: .number)
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("250")
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
