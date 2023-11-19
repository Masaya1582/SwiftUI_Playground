//
//  PokemonView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/11/19.
//

import SwiftUI

struct PokemonView<T>: View {
    let pokemon: Pokemons<T>

    var body: some View {
        VStack {
            Text("Pokemon Details")
                .font(.title)
                .padding()

            Text("Name: \(pokemon.name)")
                .padding()

            if let power = pokemon.type as? Pikachu {
                Text("Electric Power: \(power.power)")
                    .padding()
            } else if let power = pokemon.type as? Bulbasaur {
                Text("Grass Power: \(power.grassPower)")
                    .padding()
            } else if let power = pokemon.type as? Charmander {
                Text("Fire Power: \(power.firePower)")
                    .padding()
            }
        }
    }
}
