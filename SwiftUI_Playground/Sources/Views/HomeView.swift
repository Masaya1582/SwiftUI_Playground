//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var tasks: [TaskItem] = [
        TaskItem(title: "Buy groceries", completed: false),
        TaskItem(title: "Work on project", completed: false),
        TaskItem(title: "Exercise", completed: false),
        TaskItem(title: "Buy groceries", completed: false),
        TaskItem(title: "Work on project", completed: false),
        TaskItem(title: "Exercise", completed: false),
        TaskItem(title: "Buy groceries", completed: false),
        TaskItem(title: "Work on project", completed: false),
        TaskItem(title: "Exercise", completed: false),
        TaskItem(title: "Buy groceries", completed: false),
        TaskItem(title: "Work on project", completed: false),
        TaskItem(title: "Exercise", completed: false)
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    TaskRowView(task: $tasks[getIndex(for: task)])
                }
                .onDelete(perform: deleteTask)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("TODO List")
            .navigationBarItems(trailing: EditButton())
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    private func getIndex(for task: TaskItem) -> Array<TaskItem>.Index {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            return index
        }
        return tasks.startIndex
    }
}

struct TaskRowView: View {
    @Binding var task: TaskItem

    var body: some View {
        HStack {
            Text(task.title)
                .font(.title)
                .foregroundColor(task.completed ? .gray : .primary)
            Spacer()
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(task.completed ? .green : .gray)
                .onTapGesture {
                    task.completed.toggle()
                }
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
