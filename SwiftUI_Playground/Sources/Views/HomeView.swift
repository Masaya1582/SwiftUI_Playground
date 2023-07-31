//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var weatherViewModel = WeatherViewModel()
    @State private var city = ""

    var body: some View {
        VStack {
            if let weatherData = weatherViewModel.weatherData {
                WeatherDetailView(weatherData: weatherData)
            }
            TextField("Enter city name", text: $city)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Get Weather", action: fetchWeatherData)
                .padding()

        }
        .padding()
    }

    private func fetchWeatherData() {
        weatherViewModel.fetchWeatherData(for: city)
    }
}

struct WeatherDetailView: View {
    let weatherData: WeatherModel
    
    var body: some View {
        VStack(spacing: 24) {
            Text(weatherData.city)
                .font(.title)

            Text("\(weatherData.temperature)°C")
                .font(.headline)

            Text(weatherData.condition)
                .font(.subheadline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
