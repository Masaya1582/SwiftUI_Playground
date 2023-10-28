//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var tasks = [
        Task(title: "Buy groceries", completed: false),
        Task(title: "Finish SwiftUI project", completed: false),
        Task(title: "Go for a run", completed: false),
        Task(title: "Buy groceries", completed: false),
        Task(title: "Finish SwiftUI project", completed: false),
        Task(title: "Buy groceries", completed: false),
        Task(title: "Finish SwiftUI project", completed: false),
        Task(title: "Buy groceries", completed: false),
        Task(title: "Finish SwiftUI project", completed: false)
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach($tasks) { $task in
                    HStack {
                        FancyCheckbox(isChecked: $task.completed)
                        Text(task.title)
                            .strikethrough(task.completed)
                            .foregroundColor(task.completed ? .gray : .primary)
                    }
                }
                .onDelete(perform: deleteTasks)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Fancy TODO List")
            .navigationBarItems(trailing: EditButton())
        }
    }

    private func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct FancyCheckbox: View {
    @Binding var isChecked: Bool

    var body: some View {
        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(isChecked ? .green : .gray)
            .onTapGesture {
                isChecked.toggle()
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
