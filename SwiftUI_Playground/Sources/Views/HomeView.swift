//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var pathStore = PathStore()

    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(id: 0)
                .navigationDestination(for: Int.self, destination: DetailView.init)
                .navigationTitle("Navigation")
        }
    }
}

struct DetailView: View {
    var id: Int

    var body: some View {
        VStack {
            Text("View \(id)")
                .font(.largeTitle)
            NavigationLink("Jump to random", value: Int.random(in: 1...100))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
