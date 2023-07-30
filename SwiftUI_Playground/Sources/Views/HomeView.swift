//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var taskManagerViewModel = TaskManagerViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(taskManagerViewModel.categories, id: \.name) { category in
                        Section(header: Text(category.name)) {
                            ForEach(category.tasks) { task in
                                TaskRow(task: task)
                            }
                        }
                    }
                }

                Button(action: addNewTask) {
                    Text("Add New Task")
                        .font(.custom(FontFamily.Caprasimo.regular, size: 24))
                }
                .padding()
            }
            .navigationBarTitle("Task Manager")
        }
    }

    private func addNewTask() {
        let newTask = Task(id: UUID(), title: "New Task", isCompleted: false)
        taskManagerViewModel.addTask(newTask)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
