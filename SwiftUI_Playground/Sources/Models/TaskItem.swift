//
//  TaskItem.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct TaskItem: Identifiable {
    let id = UUID()
    var title: String
    var completed: Bool
}
