//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = GitHubViewModel()
    @State private var username: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter GitHub username", text: $username)
                    .padding()

                Button("Fetch Repositories") {
                    viewModel.fetchRepositories(for: username)
                }
                .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .yellow))

                List(viewModel.repositories, id: \.name) { repo in
                    VStack(alignment: .leading) {
                        Text(repo.name)
                            .font(.headline)
                        Text(repo.description ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle("GitHub Repositories")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
