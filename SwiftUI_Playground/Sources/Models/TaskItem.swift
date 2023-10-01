//
//  TaskItem.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

enum Priority: String, CaseIterable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

struct TaskItem: Identifiable {
    let id = UUID()
    var title: String
    var priority: Priority
    var completed: Bool = false
}

class TaskStore: ObservableObject {
    @Published var tasks: [TaskItem] = []
}
