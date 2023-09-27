//
//  Recipe.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let ingredients: [String]
    let instructions: [String]
}
