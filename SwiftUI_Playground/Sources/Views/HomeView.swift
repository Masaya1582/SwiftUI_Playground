//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

// Define an enum to represent the different states of the network request.
enum RequestState<T> {
    case idle
    case loading
    case success(T)
    case failure(Error)
}

struct HomeView: View {
    @State private var todos: RequestState<[Todo]> = .idle

    var body: some View {
        NavigationView {
            VStack {
                switch todos {
                case .idle:
                    Text("Tap the button to fetch todos.")
                        .modifier(CustomLabel(foregroundColor: .black, size: 24))
                case .loading:
                    ProgressView("Loading...")
                        .modifier(CustomLabel(foregroundColor: .black, size: 24))
                case .success(let todos):
                    List(todos) { todo in
                        Text(todo.title)
                    }
                case .failure(let error):
                    Text("Error: \(error.localizedDescription)")
                        .modifier(CustomLabel(foregroundColor: .black, size: 24))
                }
                Button("Fetch Todos") {
                    fetchTodos()
                }
                .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
            }
            .navigationBarTitle("Todo List")
        }
    }

    private func fetchTodos() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            return
        }
        todos = .loading
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.todos = .failure(error)
                    return
                }

                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode([Todo].self, from: data)
                        self.todos = .success(decodedData)
                    } catch {
                        self.todos = .failure(error)
                    }
                }
            }
        }
        task.resume()
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
