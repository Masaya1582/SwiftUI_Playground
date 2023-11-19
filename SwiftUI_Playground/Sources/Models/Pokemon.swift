//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/11/19.
//

import Foundation
import SwiftUI

struct Pokemons<T> {
    let name: String
    let type: T
}

struct Pikachu {
    let power: Int
}

struct Bulbasaur {
    let grassPower: Int
}

struct Charmander {
    let firePower: Int
}
