//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let pokemonManager = PokemonManager()

    var body: some View {
        NavigationView {
            List(pokemonManager.pokemons, id: \.name) { pokemon in
                VStack(alignment: .leading) {
                    Text(pokemon.name)
                        .font(.headline)
                    Text(pokemon.type)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationBarTitle("Pokémon List")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
