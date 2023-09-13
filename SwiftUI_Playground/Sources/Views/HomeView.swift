//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedPriority: TaskPriority = .high
    @State private var selectedStatus: TaskStatus = .todo

    private let tasks: [Task] = [
        Task(title: "Task 1", priority: .high, status: .todo),
        Task(title: "Task 2", priority: .medium, status: .inProgress),
        Task(title: "Task 3", priority: .low, status: .completed),
        Task(title: "Task 4", priority: .medium, status: .todo),
        Task(title: "Task 5", priority: .high, status: .inProgress),
        Task(title: "Task 6", priority: .low, status: .completed)
    ]

    private var filteredTasks: [Task] {
        return tasks.filter { task in
            return task.priority == selectedPriority && task.status == selectedStatus
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Picker("Priority", selection: $selectedPriority) {
                    ForEach(TaskPriority.allCases, id: \.self) { priority in
                        Text(priority.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()

                Picker("Status", selection: $selectedStatus) {
                    ForEach(TaskStatus.allCases, id: \.self) { status in
                        Text(status.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()

                List(filteredTasks) { task in
                    Text(task.title)
                }
            }
            .navigationBarTitle("Task List")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
