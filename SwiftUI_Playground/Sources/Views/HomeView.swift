//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum WeatherStatus {
    case sunny
    case cloudy
    case rainy
    case unknown
}

enum WeatherError: Error {
    case invalidTime
    case networkError
}

struct HomeView: View {
    @State private var weatherStatus: WeatherStatus = .unknown
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            Text("Weather Status Checker")
                .font(.title)

            Button("Check Weather") {
                checkWeather()
            }

            Text(weatherStatusMessage())
                .foregroundColor(.blue)
                .padding()

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
    }

    private func fetchWeather(at time: String) throws -> WeatherStatus {
        if time != "morning" && time != "afternoon" && time != "night" {
            throw WeatherError.invalidTime
        }
        if Bool.random() {
            throw WeatherError.networkError
        }
        let statuses: [WeatherStatus] = [.sunny, .cloudy, .rainy, .unknown]
        return statuses.randomElement()!
    }


    private func checkWeather() {
        do {
            let timesOfDay = ["morning", "afternoon", "night"]
            let randomTime = timesOfDay.randomElement()!
            weatherStatus = try fetchWeather(at: randomTime)
            errorMessage = nil
        } catch WeatherError.invalidTime {
            errorMessage = "Invalid time for weather check."
        } catch WeatherError.networkError {
            errorMessage = "Network error occurred."
        } catch {
            errorMessage = "An unexpected error occurred."
        }
    }

    private func weatherStatusMessage() -> String {
        switch weatherStatus {
        case .sunny:
            return "It's a sunny day!"
        case .cloudy:
            return "It's cloudy today."
        case .rainy:
            return "It's raining. Bring an umbrella!"
        case .unknown:
            return "Weather status unknown."
        }
    }

}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
