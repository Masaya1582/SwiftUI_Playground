// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import CoreLocation
import Alamofire
import SwiftyJSON

class HomeViewModel: ObservableObject {
    @Published var weatherData: [WeatherData] = []
    private let location = CLLocation()
    private let geocoder = CLGeocoder()

    func getWeatherData() {
        let apiKey = "1cf64fe7c890079e48eeb10abd855b58"
        let baseUrl = "https://api.openweathermap.org/data/2.5/weather?"
        let units = "metric"
        let count = 10

        for _ in 0..<count {
            let latitude = Double.random(in: -90...90)
            let longitude = Double.random(in: -180...180)
            let url = "\(baseUrl)lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=\(units)"

            AF.request(url).responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let temperature = json["main"]["temp"].doubleValue
                    let description = json["weather"][0]["description"].stringValue

                    self.geocoder.reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude)) { placemarks, error in
                        if let placemark = placemarks?.first {
                            let locationName = placemark.locality ?? placemark.name ?? "Unknown Location"
                            let data = WeatherData(temperature: temperature, description: description, locationName: locationName)
                            self.weatherData.append(data)
                        } else {
                            let data = WeatherData(temperature: temperature, description: description, locationName: "Unknown Location")
                            self.weatherData.append(data)
                        }
                    }

                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
