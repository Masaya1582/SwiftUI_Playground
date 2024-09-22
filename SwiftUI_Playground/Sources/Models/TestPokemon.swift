//
//  TestPokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2024/09/22.
//

import Foundation

class TestPokemon {
    var name: String
    var type: String
    var health: Int

    init(name: String, type: String, health: Int) {
        self.name = name
        self.type = type
        self.health = health
    }

    func takeDamage(_ damage: Int) {
        health = max(health - damage, 0)
    }

    func isFainted() -> Bool {
        return health == 0
    }
}
