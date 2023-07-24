// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var searchResults: [Pokemon] = []

    private var cancellables: Set<AnyCancellable> = []

    init() {
        $searchQuery
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .flatMap { query in
                self.fetchPokemons(with: query)
            }
            .sink(receiveValue: { [weak self] results in
                self?.searchResults = results
            })
            .store(in: &cancellables)
    }

    func fetchPokemons(with query: String) -> AnyPublisher<[Pokemon], Never> {
        // Replace this with a real API call or data processing logic to fetch Pokemon based on the search query.
        // For simplicity, we'll just use a static list of Pokemon.
        let pokemons = [
            Pokemon(name: "Charmander", type: "Fire"),
            Pokemon(name: "Squirtle", type: "Water"),
            Pokemon(name: "Bulbasaur", type: "Grass"),
            Pokemon(name: "Pikachu", type: "Electric"),
            Pokemon(name: "Magikarp", type: "Water"),
            Pokemon(name: "Charizard", type: "Fire")
        ]

        let filteredPokemons = pokemons.filter { $0.name.lowercased().contains(query.lowercased()) }
        return Just(filteredPokemons).eraseToAnyPublisher()
    }
}
