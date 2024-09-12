//
//  PokemonRequest.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/09/10.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import Foundation
import APIKit

struct PokemonRequest: Request {
    typealias Response = Pokemon
    let id: Int

    var baseURL: URL {
        guard let url = URL(string: "https://pokeapi.co/api/v2") else { fatalError("URL not Found") }
        return url
    }

    var path: String {
        return "/pokemon/\(id)"
    }

    var method: HTTPMethod {
        return .get
    }

    var dataParser: DataParser {
        return JSONDataParser()
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Pokemon {
        return try apiResponse(object: object, urlResponse: urlResponse, to: Pokemon.self)
    }
}
