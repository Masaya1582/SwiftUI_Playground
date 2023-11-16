//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/11/16.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import Foundation

struct Pokemon: Hashable {
    let id: Int
    let name: String
    let type: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(type)
    }
}
