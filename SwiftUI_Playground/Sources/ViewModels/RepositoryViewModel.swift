// 
//  RepositoryViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class RepositoryViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    private var cancellables: Set<AnyCancellable> = []

    func fetchRepositories() {
        guard let url = URL(string: "https://api.github.com/repositories") else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Repository].self, decoder: JSONDecoder())
            .replaceError(with: []) // Handle any decoding errors gracefully
            .receive(on: DispatchQueue.main)
            .sink { [weak self] repositories in
                self?.repositories = repositories
            }
            .store(in: &cancellables)
    }

}
