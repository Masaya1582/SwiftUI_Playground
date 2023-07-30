//
//  TaskRow.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/30.
//

import SwiftUI

struct TaskRow: View {
    @State private var isCompleted: Bool
    var task: Task

    init(task: Task) {
        _isCompleted = State(initialValue: task.isCompleted)
        self.task = task
    }

    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isCompleted ? .green : .gray)
                .onTapGesture {
                    toggleTaskCompletion()
                }
        }
    }

    private func toggleTaskCompletion() {
        isCompleted.toggle()
        TaskManagerViewModel().toggleTaskCompletion(task)
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: Task.exampleTasks[0])
    }
}
