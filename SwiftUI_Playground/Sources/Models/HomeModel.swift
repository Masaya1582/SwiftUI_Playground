//
//  HomeModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct PokemonResponse: Decodable {
    let results: [Pokemon]
}

struct Pokemon: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
