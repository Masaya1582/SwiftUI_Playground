//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var pokemons: [Pokemons] = []

    var body: some View {
        NavigationView {
            if pokemons.isEmpty {
                ProgressView()
            } else {
                List(pokemons, id: \.name) { pokemon in
                    Text(pokemon.name.capitalized)
                }
                .navigationTitle("Pokémon List")
            }
        }
        // Use the `.task` modifier to perform async operations during view lifecycle
        .task {
            do {
                pokemons = try await fetchPokemonList()
            } catch {
                print("Error fetching Pokémon: \(error.localizedDescription)")
            }
        }
    }

    // Function to fetch Pokémon data asynchronously
    private func fetchPokemonList() async throws -> [Pokemons] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {
            throw URLError(.badURL)
        }
        // ① Perform an async network call to fetch data from the URL
        let (data, _) = try await URLSession.shared.data(from: url)
        // ② Decode the received JSON data into a PokemonListResponse struct
        let decoded = try JSONDecoder().decode(PokemonListResponse.self, from: data)
        // ③ Return the array of Pokemons fetched from the API
        return decoded.results
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
