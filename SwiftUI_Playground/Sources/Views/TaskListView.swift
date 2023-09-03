//
//  TaskListView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/09/03.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var taskManager: TaskManager // Inject the TaskManager here
    @State private var newTaskTitle = ""

    var body: some View {
        List {
            Section(header: Text("Add Task")) {
                HStack {
                    TextField("Task title", text: $newTaskTitle)
                    Button(action: addTask) {
                        Text("Add")
                    }
                }
            }

            Section(header: Text("Tasks")) {
                ForEach(taskManager.tasks) { task in
                    Text(task.title)
                }
                .onDelete(perform: deleteTask)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("To-Do List")
    }

    func addTask() {
        let trimmedTitle = newTaskTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        if !trimmedTitle.isEmpty {
            let newTask = Task(title: trimmedTitle)
            taskManager.tasks.append(newTask)
            newTaskTitle = ""
        }
    }

    func deleteTask(at offsets: IndexSet) {
        taskManager.tasks.remove(atOffsets: offsets)
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
