//
//  DefaultModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    var name: String
    var genre: String
}

// Holds one token that we want the user to filter by. This *must* conform to Identifiable.
struct Token: Identifiable {
    var id: String { name }
    var name: String
}
