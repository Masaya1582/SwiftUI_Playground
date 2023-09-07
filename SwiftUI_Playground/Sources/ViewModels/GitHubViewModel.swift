// 
//  GitHubViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class GitHubViewModel: ObservableObject {
    @Published var repositories: [Repository] = []

    private var cancellables: Set<AnyCancellable> = []

    func fetchRepositories(for user: String) {
        guard let url = URL(string: "https://api.github.com/users/\(user)/repos") else {
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Repository].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] repositories in
                self?.repositories = repositories
            }
            .store(in: &cancellables)
    }
}
