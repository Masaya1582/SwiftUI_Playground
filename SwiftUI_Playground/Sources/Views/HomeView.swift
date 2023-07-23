//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var pokemons: [Pokemon] = []
    @State private var errorMessage: String = ""

    var body: some View {
        VStack {
            if !pokemons.isEmpty {
                List(pokemons) { pokemon in
                    VStack(alignment: .leading) {
                        Text(pokemon.name)
                            .font(.headline)
                        Text(pokemon.type)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            } else if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                Text("Loading Pokémon...")
            }
        }
        .onAppear {
            fetchPokemons()
        }
    }

    private func fetchPokemons() {
        let manager = PokemonManager()
        manager.fetchPokemons { result in
            switch result {
            case .success(let pokemons):
                self.pokemons = pokemons
            case .failure(let error):
                self.errorMessage = "Error fetching Pokémon data: \(error)"
            }
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
