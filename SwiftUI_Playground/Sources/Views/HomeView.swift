//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

enum GithubAPI {
    static func searchRepos(page: Int, perPage: Int) -> AnyPublisher<[Repository], Error> {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=swift&sort=stars&page=\(page)&per_page=\(perPage)") else { fatalError("URL not found") }
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(GithubSearchResult.self, from: $0.data).items }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

struct HomeView: View {
    @State private var repositories: [Repository] = []
    @State private var page = 1
    @State private var isFetching = false
    @State private var subscriptions = Set<AnyCancellable>()
    @State private var showingAlert = false
    @State private var errorMessage = ""

    var body: some View {
        List {
            ForEach(repositories) { repository in
                VStack(alignment: .leading) {
                    Text(repository.name)
                        .font(.custom(FontFamily.Caprasimo.regular, size: 20))
                    Text(repository.description ?? "")
                    Text("Star: \(repository.stargazersCount)")
                }
                .onAppear {
                    if self.repositories.last == repository {
                        self.fetchRepositories()
                    }
                }
            }
            if self.isFetching {
                Spinner()
                    .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
            }
        }
        .onAppear {
            self.fetchRepositories()
        }
        .alert(isPresented: self.$showingAlert) {
            Alert(
                title: Text("Error"),
                message: Text(self.errorMessage),
                dismissButton: .default(Text("Close")))
        }
    }

    private func fetchRepositories() {
        guard !isFetching else { return }
        isFetching = true
        GithubAPI.searchRepos(page: self.page, perPage: 30)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isFetching = false
                case let .failure(error):
                    self.isFetching = false
                    self.showingAlert = true
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { repositories in
                self.repositories += repositories
                self.page += 1
            })
            .store(in: &self.subscriptions)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
