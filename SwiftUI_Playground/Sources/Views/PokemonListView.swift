//
//  PokemonListView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/23.
//

import SwiftUI

struct PokemonListView: View {
    let pokemons: [Pokemon]

    var body: some View {
        List(pokemons) { pokemon in
            VStack(alignment: .leading) {
                Text(pokemon.name)
                    .font(.headline)
                Text("Type: \(pokemon.type)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Ability: \(pokemon.ability.description)")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
        }
        .navigationBarTitle("Pokémon List")
    }
}
