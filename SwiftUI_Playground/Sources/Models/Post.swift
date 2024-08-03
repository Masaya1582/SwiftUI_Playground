//
//  Post.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/08/03.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import APIKit
import SwiftyJSON

struct GETRequest<T: Decodable>: Request {
    typealias Response = T

    var baseURL: URL
    var path: String
    var method: HTTPMethod {
        return .get
    }

    var queryParameters: [String: Any]?

    init(baseURL: URL, path: String, queryParameters: [String: Any]? = nil) {
        self.baseURL = baseURL
        self.path = path
        self.queryParameters = queryParameters
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> T {
        let json = JSON(object)
        // TがDecodableに準拠している場合、JSONDecoderを使用してデコード
        let data = try json.rawData()
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
