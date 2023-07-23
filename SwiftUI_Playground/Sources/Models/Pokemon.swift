//
//  Pokemon.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Pokemon: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let type: String
    var level: Int
}
