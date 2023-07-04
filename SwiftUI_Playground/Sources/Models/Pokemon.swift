//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    var id: Int
    var name: String
    var type: String
    var level: Int

    init(id: Int, name: String, type: String, level: Int) {
        self.id = id
        self.name = name
        self.type = type
        self.level = level
    }

}
