//
//  PokemonService.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2024/08/26.
//

import Foundation
import Combine

enum APIError: Error {
    case networkError(Error)
    case decodingError(Error)
    case unknownError
}

final class PokemonService {
    private var cancellables = Set<AnyCancellable>()

    func fetchPokemonList() -> AnyPublisher<[Pokemon], APIError> {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=50") else {
            return Fail(error: APIError.unknownError).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PokemonResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .mapError { error -> APIError in
                if let decodingError = error as? DecodingError {
                    return .decodingError(decodingError)
                } else {
                    return .networkError(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
