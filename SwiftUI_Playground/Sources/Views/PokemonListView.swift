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
                Text("Name: \(pokemon.name)")
                    .font(.headline)
                Text("Type: \(pokemon.type)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                if let regularPokemon = pokemon as? RegularPokemon {
                    Text("Ability: \(regularPokemon.ability)")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                } else if let legendaryPokemon = pokemon as? LegendaryPokemon {
                    Text("Description: \(legendaryPokemon.description)")
                        .font(.subheadline)
                        .foregroundColor(.purple)
                }
            }
        }
        .navigationBarTitle("Pokémon List")
    }
}
