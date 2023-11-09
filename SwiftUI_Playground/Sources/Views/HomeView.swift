//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject var viewModel: TodoViewModel

    var body: some View {
        List(viewModel.todos, id: \.id) { todo in
            Text(todo.title)
                .foregroundColor(todo.completed ? .green : .red)
        }
        .onAppear {
            Task {
                await viewModel.fetchTodos()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var viewModel = TodoViewModel()
    static var previews: some View {
        Group {
            HomeView(viewModel: viewModel)
                .preferredColorScheme(.light)
            HomeView(viewModel: viewModel)
                .preferredColorScheme(.dark)
        }
    }
}
