// 
//  TaskManagerViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class TaskManagerViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var categories: [Category] = []

    init() {
        // You can replace this with your data loading mechanism.
        tasks = Task.exampleTasks
        categories = [
            Category(name: "Personal", tasks: Task.exampleTasks),
            Category(name: "Work", tasks: [])
        ]
    }

    func addTask(_ task: Task) {
        tasks.append(task)
    }

    func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}
