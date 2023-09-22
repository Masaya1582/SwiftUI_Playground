//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var joke: [Joke] = []

    var body: some View {
        NavigationView {
            VStack {
                Button {
                    fetchJoke()
                } label: {
                    Text("Fetch Quote")
                        .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
                }
                .padding()
                List(joke, id: \.self) { jokes in
                    Text(jokes.setup)
                    Text(jokes.punchline)
                }
                .font(.custom(FontFamily.Caprasimo.regular, size: 16))
                .navigationBarTitle("Today's Joke")
            }
        }
    }

    private func fetchJoke() {
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: URL(string: "https://official-joke-api.appspot.com/random_joke")!)
                let decodedJoke = try JSONDecoder().decode(Joke.self, from: data)
                DispatchQueue.main.async {
                    self.joke.append(decodedJoke)
                }
            } catch {
                print("Error fetching joke: \(error)")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
