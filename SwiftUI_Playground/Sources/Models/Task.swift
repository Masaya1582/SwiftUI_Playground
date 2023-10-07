//
//  Task.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Task: Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
}

extension Task {
    static let allTasks = [
        Task(name: "Work"),
        Task(name: "Study"),
        Task(name: "Exercise"),
        Task(name: "Relax"),
    ]
}
