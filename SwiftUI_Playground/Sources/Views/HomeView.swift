//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var pokemons: [Pokemon] = [
        Pokemon(name: "Bulbasaur", type: "Grass", level: 5),
        Pokemon(name: "Charmander", type: "Fire", level: 7),
        Pokemon(name: "Squirtle", type: "Water", level: 3)
    ]

    var body: some View {
        VStack {
            List(pokemons) { pokemon in
                HStack {
                    Text("\(pokemon.name)")
                    Text("Type: \(pokemon.type)")
                    Text("Level: \(pokemon.level)")
                }
            }

            Divider()

            HStack {
                Button("Level Up All") {
                    levelUpAll()
                }

                Button("Remove Weakest") {
                    removeWeakest()
                }
            }
            .padding()
        }
    }

    // Function to level up all Pokémon
    private func levelUpAll() {
        for index in 0..<pokemons.count {
            pokemons[index].level += 1
        }
    }

    // Function to remove the weakest Pokémon
    private func removeWeakest() {
        if let weakestPokemon = pokemons.min(by: { $0.level < $1.level }) {
            pokemons.removeAll { $0 == weakestPokemon }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
