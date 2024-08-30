//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct Pokemon: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let imageUrl: String
}

actor PokemonFetcher {
    private var cache: [String: Pokemon] = [:]

    func fetchPokemon(named name: String) async -> Pokemon? {
        if let cachedPokemon = cache[name] {
            return cachedPokemon
        }

        // Simulate a network delay
        await Task.sleep(2 * 1_000_000_000) // 2 seconds

        // Simulated fetched data
        let fetchedPokemon = Pokemon(name: name, type: "Electric", imageUrl: "https://example.com/pikachu.png")

        cache[name] = fetchedPokemon
        return fetchedPokemon
    }
}

@MainActor
final class PokemonViewModel: ObservableObject {
    @Published var pokemonList: [Pokemon] = []

    private let fetcher = PokemonFetcher()

    func loadPokemon() {
        Task {
            // For demonstration purposes, we're fetching the same Pokémon multiple times.
            if let pikachu = await fetcher.fetchPokemon(named: "Pikachu") {
                pokemonList.append(pikachu)
            }

            if let charmander = await fetcher.fetchPokemon(named: "Charmander") {
                pokemonList.append(charmander)
            }

            if let bulbasaur = await fetcher.fetchPokemon(named: "Bulbasaur") {
                pokemonList.append(bulbasaur)
            }
        }
    }
}


struct HomeView: View {
    @StateObject private var viewModel = PokemonViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.pokemonList) { pokemon in
                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                    HStack {
                        AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)

                        VStack(alignment: .leading) {
                            Text(pokemon.name)
                                .font(.headline)
                            Text(pokemon.type)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Pokémon List")
            .onAppear {
                viewModel.loadPokemon()
            }
        }
    }
}

struct PokemonDetailView: View {
    let pokemon: Pokemon

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)

            Text(pokemon.name)
                .font(.largeTitle)
                .padding()

            Text("Type: \(pokemon.type)")
                .font(.title2)
        }
        .navigationTitle(pokemon.name)
        .navigationBarTitleDisplayMode(.inline)
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
