//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var store = TodoStore()
    @State private var newTodoTitle = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(store.todos) { todo in
                        Button(action: {
                            store.toggleTodoCompletion(todo)
                        }) {
                            HStack {
                                Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
                                Text(todo.title)
                                    .strikethrough(todo.isCompleted)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .onDelete(perform: deleteTodo)
                }

                HStack {
                    TextField("New Todo", text: $newTodoTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {
                        store.addTodoWithTitle(newTodoTitle)
                        newTodoTitle = ""
                    }) {
                        Text("Add")
                    }
                }
                .padding()
            }
            .navigationTitle("ToDo List")
            .toolbar {
#if os(iOS)
                EditButton()
#endif
            }
        }
    }

    private func deleteTodo(at offsets: IndexSet) {
        offsets.forEach { index in
            store.removeTodoAtIndex(index)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
