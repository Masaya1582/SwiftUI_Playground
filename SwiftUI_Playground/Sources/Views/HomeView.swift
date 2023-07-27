//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var taskManager: TaskManager

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(taskManager.tasks.indices, id: \.self) { index in // Add id: \.self
                        TaskRow(task: taskManager.tasks[index], taskIndex: index) // Provide the task index
                    }
                    .onDelete(perform: taskManager.deleteTask)
                }
                AddTaskView()
            }
            .navigationBarTitle("Task Manager")
        }
    }
}

struct TaskRow: View {
    @EnvironmentObject var taskManager: TaskManager
    let task: Task
    let taskIndex: Int

    var body: some View {
        HStack {
            Text(task.name)
            Spacer()
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .gray)
                .onTapGesture {
                    taskManager.toggleTaskCompleted(at: taskIndex)
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
