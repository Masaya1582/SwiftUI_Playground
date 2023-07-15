//
//  DefaultModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

class TodoStore: ObservableObject {
    @Published var todos: [TodoItem] = []

    func addTodoWithTitle(_ title: String) {
        todos.append(TodoItem(title: title))
    }

    func toggleTodoCompletion(_ todo: TodoItem) {
        guard let index = todos.firstIndex(where: { $0.id == todo.id }) else { return }
        todos[index].isCompleted.toggle()
    }

    func removeTodoAtIndex(_ index: Int) {
        todos.remove(at: index)
    }
}
