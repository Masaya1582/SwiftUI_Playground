//
//  Post.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/08/03.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import APIKit
import SwiftyJSON

struct GetPostsRequest: Request {
    typealias Response = [Post]

    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }

    var path: String {
        return "/posts"
    }

    var method: HTTPMethod {
        return .get
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Post] {
        let json = JSON(object)
        return json.arrayValue.map { Post(json: $0) }
    }
}
