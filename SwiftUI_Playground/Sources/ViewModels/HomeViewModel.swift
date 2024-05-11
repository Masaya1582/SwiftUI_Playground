// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

final class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    private var cancellables = Set<AnyCancellable>()
    private var dataService = DataService()

    func loadPokemon() {
        dataService.fetchPokemon()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] pokemons in
                self?.pokemons = pokemons
            })
            .store(in: &cancellables)
    }
}

final class DataService {
    var cancellables = Set<AnyCancellable>()

    func fetchPokemon() -> AnyPublisher<[Pokemon], Error> {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100") else {
            fatalError("URL not Found")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PokemonList.self, decoder: JSONDecoder())
            .map { $0.results }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
