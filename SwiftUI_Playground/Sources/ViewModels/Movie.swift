// 
//  Movie.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftyJSON
import SwiftUI

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let year: Int
    let posterURL: URL?

    init(json: JSON) {
        title = json["Title"].stringValue
        year = json["Year"].intValue
        posterURL = URL(string: json["Poster"].stringValue)
    }
}

class MovieStore: ObservableObject {
    @Published var movies = [Movie]()

    init() {
        guard let url = URL(string: "https://www.omdbapi.com/?s=star%20wars&apikey=f8a4e52d") else {
            fatalError("URL not found")
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let json = JSON(data)
                let movieArray = json["Search"].arrayValue
                self.movies = movieArray.map { Movie(json: $0) }
            }
        }.resume()
    }
}
