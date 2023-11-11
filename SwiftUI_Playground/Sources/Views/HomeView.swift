//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    var body: some View {
        let tasks = [
            Task(title: "Complete Assignment", priority: "High"),
            Task(title: "Read a Book", priority: "Medium"),
            Task(title: "Go for a Run", priority: "Low")
        ]
        return TaskListView(tasks: tasks)
    }
}

struct TaskListView: View {
    let tasks: [Task]

    var body: some View {
        NavigationView {
            List(tasks) { task in
                NavigationLink(destination: TaskDetail(task: task)) {
                    TaskRow(task: task)
                }
            }
            .navigationTitle("Task List")
        }
    }
}

struct TaskRow: View {
    let task: Task

    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            Text("Priority: \(task.priority)")
                .foregroundColor(priorityColor(task.priority))
        }
        .padding()
    }

    private func priorityColor(_ priority: String) -> Color {
        switch priority.lowercased() {
        case "high":
            return .red
        case "medium":
            return .orange
        case "low":
            return .green
        default:
            return .black
        }
    }
}

struct TaskDetail: View {
    let task: Task

    var body: some View {
        VStack(alignment: .leading) {
            Text("Task Detail")
                .font(.largeTitle)
                .padding()

            Text("Title: \(task.title)")
                .padding()

            Text("Priority: \(task.priority)")
                .foregroundColor(priorityColor(task.priority))
                .padding()
            Spacer()
        }
        .navigationTitle(task.title)
    }

    private func priorityColor(_ priority: String) -> Color {
        switch priority.lowercased() {
        case "high":
            return .red
        case "medium":
            return .orange
        case "low":
            return .green
        default:
            return .black
        }
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
