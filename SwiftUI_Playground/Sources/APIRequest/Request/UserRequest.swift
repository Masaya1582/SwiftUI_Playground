//
//  UserRequest.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/09/10.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import Foundation
import APIKit

struct UserRequest: Request {
    typealias Response = User
    let id: Int

    var baseURL: URL {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com") else { fatalError("URL not Found") }
        return url
    }

    var path: String {
        return "/users/\(id)"
    }

    var method: HTTPMethod {
        return .get
    }

    var dataParser: DataParser {
        return JSONDataParser()
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> User {
        guard let data = object as? Data else {
            throw APIError.invalidData
        }
        guard (200...299).contains(urlResponse.statusCode) else {
            throw APIError.invalidStatusCode(urlResponse.statusCode)
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(User.self, from: data)
        } catch let decodingError as DecodingError {
            throw APIError.decodingFailed(decodingError.localizedDescription)
        } catch {
            throw APIError.unknownError(error.localizedDescription)
        }
    }
}
