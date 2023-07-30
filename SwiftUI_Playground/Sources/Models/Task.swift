//
//  Task.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
    let id: UUID
    var title: String
    var isCompleted: Bool
}

extension Task {
    static var exampleTasks: [Task] {
        return [
            Task(id: UUID(), title: "Buy groceries", isCompleted: false),
            Task(id: UUID(), title: "Clean the house", isCompleted: false),
            Task(id: UUID(), title: "Read a book", isCompleted: true),
            Task(id: UUID(), title: "Go for a walk", isCompleted: false)
        ]
    }
}
