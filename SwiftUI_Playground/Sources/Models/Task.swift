//
//  Task.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let title: String
    let priority: String
}
