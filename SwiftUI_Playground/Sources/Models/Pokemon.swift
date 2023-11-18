//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/11/18.
//

import Foundation

protocol Pokémon {
    var name: String { get }
    var type: String { get }
    var level: Int { get }
}

struct Pikachu: Pokémon {
    let name: String = "Pikachu"
    let type: String = "Electric"
    let level: Int = 30
}

struct Charmander: Pokémon {
    let name: String = "Charmander"
    let type: String = "Fire"
    let level: Int = 25
}

struct Squirtle: Pokémon {
    let name: String = "Squirtle"
    let type: String = "Water"
    let level: Int = 28
}

struct Bulbasaur: Pokémon {
    let name: String = "Bulbasaur"
    let type: String = "Grass/Poison"
    let level: Int = 27
}

struct Charizard: Pokémon {
    let name: String = "Charizard"
    let type: String = "Fire/Flying"
    let level: Int = 36
}

struct Jigglypuff: Pokémon {
    let name: String = "Jigglypuff"
    let type: String = "Normal/Fairy"
    let level: Int = 22
}

struct Eevee: Pokémon {
    let name: String = "Eevee"
    let type: String = "Normal"
    let level: Int = 24
}

struct Snorlax: Pokémon {
    let name: String = "Snorlax"
    let type: String = "Normal"
    let level: Int = 40
}
