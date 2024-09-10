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
    typealias Response = UserResponse

    var baseURL: URL {
        return URL(string: "https://api.example.com")!
    }

    var path: String {
        return "/users"
    }

    var method: HTTPMethod {
        return .get
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> UserResponse {
        return try JSONDecoder().decode(UserResponse.self, from: object as! Data)
    }
}
