//
//  ColorPalette.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct ColorPalette: Identifiable {
    let id = UUID()
    let name: String
    let colors: [Color]

    init(name: String, colors: [Color]) {
        self.name = name
        self.colors = colors
    }
}
