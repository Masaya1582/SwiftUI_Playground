//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = WeatherViewModel()

    var body: some View {
        VStack {
            Text("Weather Information")
                .font(.title)
                .padding()

            Text("Temperature: \(viewModel.temperature) °C")
                .font(.headline)
                .padding()

            Text("Humidity: \(viewModel.humidity) %")
                .font(.headline)
                .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
