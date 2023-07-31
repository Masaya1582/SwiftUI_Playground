// 
//  WeatherViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import SwiftyJSON

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherModel?

    func fetchWeatherData(for city: String) {
        let apiKey = "1cf64fe7c890079e48eeb10abd855b58" // Replace with your OpenWeatherMap API key
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print("No data available: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let json = try JSON(data: data)
                DispatchQueue.main.async {
                    self.parseJSON(json)
                }
            } catch {
                print("JSON parsing error: \(error.localizedDescription)")
            }
        }.resume()
    }

    private func parseJSON(_ json: JSON) {
        let city = json["name"].stringValue
        let temperature = json["main"]["temp"].doubleValue
        let condition = json["weather"][0]["main"].stringValue

        self.weatherData = WeatherModel(city: city, temperature: temperature, condition: condition)
    }
}
