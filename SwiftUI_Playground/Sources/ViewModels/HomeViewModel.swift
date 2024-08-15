// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchPokemons()
    }

    func fetchPokemons() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=10") else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output -> Data in
                print("Received Data: \(String(data: output.data, encoding: .utf8) ?? "")")
                return output.data
            }
            .decode(type: PokemonResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: &$pokemons)
    }

}
