//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class Pokemon: Identifiable, Hashable, Equatable {
    let id = UUID()
    let name: String
    let type: String

    init(name: String, type: String) {
        self.name = name
        self.type = type
    }

    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

class RegularPokemon: Pokemon {
    let ability: String

    init(name: String, type: String, ability: String) {
        self.ability = ability
        super.init(name: name, type: type)
    }
}

class LegendaryPokemon: Pokemon {
    let description: String

    init(name: String, type: String, description: String) {
        self.description = description
        super.init(name: name, type: type)
    }
}
