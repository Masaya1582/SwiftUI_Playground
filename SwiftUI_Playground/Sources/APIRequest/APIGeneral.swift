//
//  APIError.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/09/10.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import Foundation
import APIKit

enum APIError: Error {
    case invalidData
    case invalidStatusCode(Int)
    case decodingFailed(String)
    case unknownError(String)

    var localizedDescription: String {
        switch self {
        case .invalidData:
            return "The data received from the server was invalid."
        case .invalidStatusCode(let code):
            return "The request failed with status code \(code)."
        case .decodingFailed(let message):
            return "Decoding failed: \(message)"
        case .unknownError(let message):
            return "An unknown error occurred: \(message)"
        }
    }
}

final class JSONDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }

    func parse(data: Data) throws -> Any {
        return data
    }
}

func apiResponse<T: Decodable>(object: Any, urlResponse: HTTPURLResponse, to type: T.Type) throws -> T {
    guard let data = object as? Data else {
        throw APIError.invalidData
    }
    guard (200...299).contains(urlResponse.statusCode) else {
        throw APIError.invalidStatusCode(urlResponse.statusCode)
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch let decodingError as DecodingError {
        throw APIError.decodingFailed(decodingError.localizedDescription)
    } catch {
        throw APIError.unknownError(error.localizedDescription)
    }

}
