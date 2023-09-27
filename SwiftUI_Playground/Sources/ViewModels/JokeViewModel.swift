// 
//  JokeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class JokeViewModel: ObservableObject {
    @Published var joke: Joke?

    func fetchRandomJoke() {
        if let url = URL(string: "https://v2.jokeapi.dev/joke/Programming?type=single") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let decodedJoke = try? decoder.decode(Joke.self, from: data) {
                        DispatchQueue.main.async {
                            self.joke = decodedJoke
                        }
                    }
                }
            }.resume()
        }
    }
}
