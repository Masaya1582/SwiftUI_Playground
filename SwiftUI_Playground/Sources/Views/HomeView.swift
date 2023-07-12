//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var joke: Joke?

    var body: some View {
        VStack {
            if let joke = joke {
                Text(joke.setup)
                    .font(.title)
                    .padding()

                Text(joke.punchline)
                    .font(.headline)
                    .padding()
            } else {
                ProgressView()
            }
        }
        .task {
            await fetchJoke()
        }
    }

    func fetchJoke() async {
        guard let url = URL(string: "https://official-joke-api.appspot.com/random_joke") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            joke = try JSONDecoder().decode(Joke.self, from: data)
        } catch {
            print("Error fetching joke: \(error)")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
