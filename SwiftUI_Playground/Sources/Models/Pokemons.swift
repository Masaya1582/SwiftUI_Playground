//
//  Pokemons.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/11/20.
//

import Foundation

class Pokemons {
    var name: String

    init(name: String) {
        self.name = name
    }

    func attack() -> String {
        return "\(name) performs a basic attack!"
    }
}

final class FirePokemon: Pokemons {
    func fireAttack() -> String {
        return "\(name) uses Fire attack!"
    }
}

final class WaterPokemon: Pokemons {
    func waterAttack() -> String {
        return "\(name) uses Water attack!"
    }
}

final class GrassPokemon: Pokemons {
    func grassAttack() -> String {
        return "\(name) uses Grass attack!"
    }
}
