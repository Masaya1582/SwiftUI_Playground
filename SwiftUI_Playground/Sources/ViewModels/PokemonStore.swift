// 
//  PokemonStore.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class PokemonStore: ObservableObject {
    // UserDefaultsに保存する
    @Published var pokemons: [Pokemon] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(pokemons) {
                UserDefaults.standard.set(encoded, forKey: "pokemons")
            }
        }
    }

    // UserDefaultsから情報を取得する
    init() {
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
