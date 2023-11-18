//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = PokemonViewModel()
    @State private var pokemonList: [Pokemon] = []

    var body: some View {
        VStack {
            if pokemonList.isEmpty {
                ProgressView("Loading Pokémon...")
            } else {
                List(pokemonList, id: \.name) { pokemon in
                    PokemonView(pokemon: pokemon)
                }
            }
        }
        .onAppear {
            Task {
                let fetchedPokemon = await viewModel.fetchPokemonData()
                pokemonList = fetchedPokemon
            }
        }
    }
}

struct PokemonView: View {
    let pokemon: Pokemon

    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(pokemon.name)")
            Text("Type: \(pokemon.type)")
            Text("Level: \(pokemon.level)")
        }
        .frame(width: 240, height: 120)
        .border(Color.black)
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
