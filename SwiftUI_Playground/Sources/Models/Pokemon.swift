//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

// ポケモンプロトコル (約束事)
protocol Pokemon {
    var name: String { get } // 名前
    var type: String { get } // タイプ
    var level: Int { get } // レベル
}

// ポケモンプロトコルを準拠したPokemonType構造体
struct PokemonType: Pokemon {
    var name: String
    var type: String
    var level: Int

    init(name: String, type: String, level: Int) {
        self.name = name
        self.type = type
        self.level = level
    }
}
