//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

protocol Ability {
    var description: String { get }
}

struct OvergrowAbility: Ability {
    var description: String {
        return "Powers up Grass-type moves in a pinch."
    }
}

struct BlazeAbility: Ability {
    var description: String {
        return "Powers up Fire-type moves in a pinch."
    }
}

struct StaticAbility: Ability {
    var description: String {
        return "May cause paralysis if the foe makes contact."
    }
}

struct Pokemon: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let ability: Ability
}
