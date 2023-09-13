//
//  TaskRowView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/09/13.
//

import SwiftUI

struct TaskRowView: View {
    var task: Task
    var toggleTaskCompletion: () -> Void

    var body: some View {
        HStack {
            Button(action: {
                toggleTaskCompletion()
            }) {
                Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.completed ? .green : .primary)
            }

            Text(task.title)
                .strikethrough(task.completed)
                .foregroundColor(task.completed ? .gray : .primary)

            Spacer()
        }
    }
}
