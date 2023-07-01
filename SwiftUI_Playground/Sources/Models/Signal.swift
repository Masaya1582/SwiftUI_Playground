//
//  Signal.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct Signal: Identifiable {
    let id: Int // Identifiableにするときは必要
    let index: Int // ボタンのindex
    let name: String // 信号機色の名前
    let color: Color // 信号機の色

    init(id: Int, index: Int, name: String, color: Color) {
        self.id = id
        self.index = index
        self.name = name
        self.color = color
    }
}
