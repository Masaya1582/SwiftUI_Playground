// 
//  PokemonStore.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class PokemonStore: ObservableObject {
    @Published var pokemons: [Pokemon] {
        // Save to UserDefaults
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(pokemons) {
                UserDefaults.standard.set(encoded, forKey: "pokemons")
            }
        }
    }

    init() {
        // Load from UserDefaults
        if let savedData = UserDefaults.standard.data(forKey: "pokemons") {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode([Pokemon].self, from: savedData) {
                pokemons = loadedData
                return
            }
        }
        pokemons = []
    }
}
