//
//  HomeModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let id: Int
    let name: String
    let sprites: Sprites
}

struct Sprites: Codable {
    let front_default: URL
}

struct PokemonResponse: Codable {
    let results: [PokemonEntry]
}

struct PokemonEntry: Codable {
    let name: String
    let url: URL
}
