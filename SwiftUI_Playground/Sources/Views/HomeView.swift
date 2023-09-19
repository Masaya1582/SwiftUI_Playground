//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Task.entity(), sortDescriptors: []) var tasks: FetchedResults<Task>
    @State private var taskName = ""

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add Task")) {
                    HStack {
                        TextField("Enter task name", text: $taskName)
                            .modifier(CustomTextField())
                        Button(action: addTask) {
                            Text("Add")
                        }
                    }
                }

                Section(header: Text("Tasks")) {
                    ForEach(tasks, id: \.self) { task in
                        Text(task.name ?? "")
                    }
                    .onDelete(perform: deleteTasks)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Task List")
            .navigationBarItems(trailing: EditButton())
        }
    }

    private func addTask() {
        withAnimation {
            if !taskName.isEmpty {
                let newTask = Task(context: viewContext)
                newTask.name = taskName
                taskName = ""
                try? viewContext.save()
            }
        }
    }

    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)
            try? viewContext.save()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            HomeView()
                .preferredColorScheme(.dark)
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
