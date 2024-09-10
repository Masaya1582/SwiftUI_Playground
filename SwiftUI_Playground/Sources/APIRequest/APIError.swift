//
//  APIError.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/09/10.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import Foundation

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
