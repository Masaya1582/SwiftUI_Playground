//
//  PokemonManager.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

// Pokemon Struct
struct Pokemon {
    let name: String
    let type: String
}

// Pokemon Manager Class
class PokemonManager {
    var pokemons: [Pokemon] = []

    init() {
        // Sample Pokémon data
        let bulbasaur = Pokemon(name: "Bulbasaur", type: "Grass/Poison")
        let charmander = Pokemon(name: "Charmander", type: "Fire")
        let squirtle = Pokemon(name: "Squirtle", type: "Water")
        let pikachu = Pokemon(name: "Pikachu", type: "Electric")
        let jigglypuff = Pokemon(name: "Jigglypuff", type: "Normal/Fairy")
        let machop = Pokemon(name: "Machop", type: "Fighting")
        let gastly = Pokemon(name: "Gastly", type: "Ghost/Poison")
        let dratini = Pokemon(name: "Dratini", type: "Dragon")
        let eevee = Pokemon(name: "Eevee", type: "Normal")
        let lapras = Pokemon(name: "Lapras", type: "Water/Ice")
        let snorlax = Pokemon(name: "Snorlax", type: "Normal")

        pokemons = [bulbasaur, charmander, squirtle, pikachu, jigglypuff, machop, gastly, dratini, eevee, lapras, snorlax]
    }
}

