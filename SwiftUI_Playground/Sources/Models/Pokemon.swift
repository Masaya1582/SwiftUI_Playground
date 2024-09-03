//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2024/09/04.
//

import Foundation

class Pokemon {
    var name: String
    var type: String

    init(name: String, type: String) {
        self.name = name
        self.type = type
    }

    func attack() -> String {
        return "\(name) uses a basic attack!"
    }
}

final class Pikachu: Pokemon {
    init() {
        super.init(name: "Pikachu", type: "Electric")
    }

    override func attack() -> String {
        return "\(name) uses Thunderbolt!"
    }
}

final class Charmander: Pokemon {
    init() {
        super.init(name: "Charmander", type: "Fire")
    }

    override func attack() -> String {
        return "\(name) uses Flamethrower!"
    }
}

final class Bulbasaur: Pokemon {
    init() {
        super.init(name: "Bulbasaur", type: "Grass")
    }

    override func attack() -> String {
        return "\(name) uses Vine Whip!"
    }
}
