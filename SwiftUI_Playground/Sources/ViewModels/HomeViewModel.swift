// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Combine

class HomeViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = [
        Pokemon(name: "Charmander", type: "Fire"),
        Pokemon(name: "Squirtle", type: "Water"),
        Pokemon(name: "Bulbasaur", type: "Grass"),
        Pokemon(name: "Vulpix", type: "Fire"),
        Pokemon(name: "Pikachu", type: "Electric")
    ]
    @Published var fireTypePokemons: [Pokemon] = []

    private var cancellables: Set<AnyCancellable> = []

    func filterFireTypePokemons() {
        pokemons.publisher
            .filter { $0.type == "Fire" }
            .collect()
            .sink(receiveValue: { [weak self] fireTypePokemons in
                self?.fireTypePokemons = fireTypePokemons
            })
            .store(in: &cancellables)
    }
}
