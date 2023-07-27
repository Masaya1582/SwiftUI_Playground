//
//  TaskManager.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/27.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import Foundation

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []

    func addTask(name: String) {
        tasks.append(Task(name: name, isCompleted: false))
    }

    func deleteTask(at indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }

    func toggleTaskCompleted(at index: Int) {
        tasks[index].isCompleted.toggle()
    }
}
