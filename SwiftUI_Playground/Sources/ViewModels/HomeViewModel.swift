// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import Combine

final class PokemonViewModel: ObservableObject {
    @Published var pokemonList: [Pokemon] = []
    @Published var errorMessage: String? = nil

    private var cancellables = Set<AnyCancellable>()
    private let pokemonService = PokemonService()

    func fetchPokemon() {
        pokemonService.fetchPokemonList()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.handleError(error)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] pokemon in
                self?.pokemonList = pokemon
            })
            .store(in: &cancellables)
    }

    private func handleError(_ error: APIError) {
        switch error {
        case .networkError(let error):
            errorMessage = "Network error: \(error.localizedDescription)"
        case .decodingError(let error):
            errorMessage = "Decoding error: \(error.localizedDescription)"
        case .unknownError:
            errorMessage = "Unknown error occurred."
        }
    }
}

