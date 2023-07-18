// 
//  DefaultViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var name = ""
    @Published var type = ""
    @Published var ability = ""
    var encodedData: Data? 

    func encodePokemon() {
        let pikachu = Pokemon(name: "Pikachu", type: "Electric", ability: "Static")

        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(pikachu) {
            if let encodedString = String(data: encodedData, encoding: .utf8) {
                print("Encoded Pokémon: \(encodedString)")
                self.encodedData = encodedData // Store the encoded data in the property
            }
        }
    }

    func decodePokemon() {
        guard let encodedData = encodedData else {
            return
        }

        let decoder = JSONDecoder()
        if let decodedPokemon = try? decoder.decode(Pokemon.self, from: encodedData) {
            print("Decoded Pokémon: \(decodedPokemon)")
            name = decodedPokemon.name
            type = decodedPokemon.type
            ability = decodedPokemon.ability
        }
    }
}
