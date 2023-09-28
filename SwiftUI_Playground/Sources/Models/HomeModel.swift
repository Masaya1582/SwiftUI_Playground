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
    var title: String
}

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []

    func addTask(title: String) {
        tasks.append(Task(title: title))
    }

    func removeTask(at index: Int) {
        tasks.remove(at: index)
    }
}
