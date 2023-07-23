//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.weatherData, id: \.temperature) { data in
                    VStack(alignment: .leading) {
                        let formattedTemperature = String(format: "%.1f", data.temperature)
                        Text("\(data.locationName)")
                            .font(.title)
                        Text("\(formattedTemperature)℃")
                            .font(.title)
                        Text(data.description)
                            .font(.headline)
                    }
                }
                Button {
                    viewModel.weatherData.removeAll()
                    viewModel.getWeatherData()
                } label: {
                    Text("Refresh")
                        .font(.largeTitle)
                }
            }
            .navigationTitle("Weather")
            .onAppear {
                viewModel.getWeatherData()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
