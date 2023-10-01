//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var taskStore = TaskStore()

    @State private var newTaskTitle = ""
    @State private var selectedPriority = Priority.medium

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Picker("Priority", selection: $selectedPriority) {
                        ForEach(Priority.allCases, id: \.self) { priority in
                            Text(priority.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding()

                Button(action: addTask) {
                    Text("Add Task")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                List {
                    ForEach(taskStore.tasks) { task in
                        TaskRowView(task: task)
                            .contextMenu {
                                Button(action: {
                                    toggleTaskCompletion(task: task)
                                }) {
                                    Text(task.completed ? "Mark as Incomplete" : "Mark as Complete")
                                    Image(systemName: task.completed ? "checkmark.square" : "square")
                                }
                                Button(action: {
                                    removeTask(task: task)
                                }) {
                                    Text("Delete")
                                    Image(systemName: "trash")
                                }
                            }
                    }
                    .onDelete(perform: removeTasks)
                }
            }
            .navigationTitle("To-Do List")
            .navigationBarItems(leading: EditButton())
        }
    }

    private func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        let newTask = TaskItem(title: newTaskTitle, priority: selectedPriority)
        taskStore.tasks.append(newTask)
        newTaskTitle = ""
    }

    private func removeTask(task: TaskItem) {
        if let index = taskStore.tasks.firstIndex(where: { $0.id == task.id }) {
            taskStore.tasks.remove(at: index)
        }
    }

    private func removeTasks(at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }

    private func toggleTaskCompletion(task: TaskItem) {
        if let index = taskStore.tasks.firstIndex(where: { $0.id == task.id }) {
            taskStore.tasks[index].completed.toggle()
        }
    }
}

struct TaskRowView: View {
    var task: TaskItem

    var body: some View {
        HStack {
            Text(task.title)
                .foregroundColor(task.completed ? .gray : .black)

            Spacer()

            Text(task.priority.rawValue)
                .foregroundColor(getPriorityColor())
        }
    }

    private func getPriorityColor() -> Color {
        switch task.priority {
        case .high:
            return .red
        case .medium:
            return .orange
        case .low:
            return .green
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
