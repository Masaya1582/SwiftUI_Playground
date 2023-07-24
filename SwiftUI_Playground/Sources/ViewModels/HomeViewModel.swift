// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Combine

class HomeViewModel: ObservableObject {
    @Published var fireTypePokemons: [Pokemon] = [
        Pokemon(name: "Charmander", type: "Fire"),
        Pokemon(name: "Vulpix", type: "Fire"),
        Pokemon(name: "Charizard", type: "Fire")
    ]
    @Published var waterTypePokemons: [Pokemon] = [
        Pokemon(name: "Squirtle", type: "Water"),
        Pokemon(name: "Magikarp", type: "Water"),
        Pokemon(name: "Blastoise", type: "Water")
    ]
    @Published var pairedPokemons: [(Pokemon, Pokemon)] = []

    private var cancellables: Set<AnyCancellable> = []

    func zipPokemons() {
        let fireTypePublisher = fireTypePokemons.publisher
        let waterTypePublisher = waterTypePokemons.publisher

        Publishers.Zip(fireTypePublisher, waterTypePublisher)
            .collect()
            .sink(receiveValue: { [weak self] pairedPokemons in
                self?.pairedPokemons = pairedPokemons
            })
            .store(in: &cancellables)
    }
}
