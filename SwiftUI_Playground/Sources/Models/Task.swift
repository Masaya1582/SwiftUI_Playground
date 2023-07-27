//
//  HomeModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var name: String
    var isCompleted: Bool = false

    init(name: String, isCompleted: Bool) {
        self.name = name
        self.isCompleted = isCompleted
    }
}
