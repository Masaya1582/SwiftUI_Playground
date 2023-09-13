//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var tasks: [Task] = []
    @State private var newTaskTitle = ""

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add a New Task")) {
                    HStack {
                        TextField("Task Title", text: $newTaskTitle)
                        Button(action: {
                            addTask()
                        }) {
                            Text("Add")
                        }
                    }
                }

                Section(header: Text("Tasks")) {
                    ForEach(tasks) { task in
                        TaskRowView(task: task, toggleTaskCompletion: {
                            toggleTaskCompletion(task)
                        })
                    }
                    .onDelete(perform: deleteTask)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("To-Do List")
            .toolbar {
                EditButton()
            }
        }
    }

    private func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        let newTask = Task(title: newTaskTitle)
        tasks.append(newTask)
        newTaskTitle = ""
    }

    private func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].completed.toggle()
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
