//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = RepositoryViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.repositories, id: \.name) { repository in
                VStack(alignment: .leading) {
                    Text(repository.name)
                        .font(.headline)
                    Text(repository.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Repositories")
        }
        .onAppear {
            viewModel.fetchRepositories()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
