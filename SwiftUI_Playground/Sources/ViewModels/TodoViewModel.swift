// 
//  TodoViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []

    func fetchTodos() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedTodos = try JSONDecoder().decode([Todo].self, from: data)
            DispatchQueue.main.async {
                self.todos = decodedTodos
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
