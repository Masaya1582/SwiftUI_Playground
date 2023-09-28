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
            List {
                ForEach(taskManager.tasks) { task in
                    Text(task.title)
                        .modifier(CustomLabel(foregroundColor: .black, size: 20))
                }
                .onDelete { indexSet in
                    taskManager.tasks.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Tasks")
            .navigationBarItems(trailing: NavigationLink("Add", destination: AddTaskView()))
        }
    }
}

struct AddTaskView: View {
    @EnvironmentObject var taskManager: TaskManager
    @State private var newTaskTitle = ""

    var body: some View {
        Form {
            TextField("New Task", text: $newTaskTitle)

            Button("Add Task") {
                taskManager.addTask(title: newTaskTitle)
                newTaskTitle = ""
            }
        }
        .navigationTitle("Add Task")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
