//
//  PokemonViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/11/18.
//

import SwiftUI
import Foundation

final class PokemonViewModel: ObservableObject {
    func fetchPokemonData() async -> [Pokemon] {
        // Simulating an asynchronous network call or data fetching
        await Task.sleep(2 * 1_000_000_000) // Simulating a delay of 2 seconds

        // Simulated fetched data
        let pokemonData = [
            Pokemon(name: "Pikachu", type: "Electric", level: 30),
            Pokemon(name: "Charmander", type: "Fire", level: 25),
            Pokemon(name: "Squirtle", type: "Water", level: 28)
        ]
        return pokemonData
    }
}
