//
//  PokemonManager.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

enum PokemonAPIError: Error {
    case dataFetchingError
}

struct Pokemon: Identifiable {
    let id = UUID()
    let name: String
    let type: String
}

class PokemonManager {
    func fetchPokemons(completion: @escaping (Result<[Pokemon], PokemonAPIError>) -> Void) {
        // Simulate fetching data from an API (success/failure randomly)
        let randomSuccess = Bool.random()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if randomSuccess {
                // Simulate successful data fetch
                let pokemons = [
                    Pokemon(name: "Bulbasaur", type: "Grass/Poison"),
                    Pokemon(name: "Charmander", type: "Fire"),
                    Pokemon(name: "Squirtle", type: "Water")
                ]
                completion(.success(pokemons))
            } else {
                // Simulate data fetch failure with an error
                completion(.failure(.dataFetchingError))
            }
        }
    }
}
