//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let type: String
    let ability: String

    init(name: String, type: String, ability: String) {
        self.name = name
        self.type = type
        self.ability = ability
    }
}
