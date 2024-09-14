//
//  APIClient.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/09/10.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import Foundation
import APIKit

struct APIClient {
    static func request<T: Request>(_ request: T, completion: @escaping (Result<T.Response, SessionTaskError>) -> Void) {
        logRequestStart(request)
        Session.send(request) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
            logRequestEnd(request, result: result)
        }
    }

    private static func logRequestStart<T: Request>(_ request: T) {
        print("---- Start API Request ----")
        print("URL: \(request.baseURL)\(request.path)")
        print("Request Type: \(request.method.rawValue)")
        if let parameters = request.bodyParameters {
            print("Parameters: \(parameters)")
        } else {
            print("Parameters: None")
        }
    }

    // Custom logging function for when a request completes (success or failure)
    private static func logRequestEnd<T: Request>(_ request: T, result: Result<T.Response, SessionTaskError>) {
        switch result {
        case .success:
            print("---- API Request Successful ----")
        case .failure:
            print("---- API Request Failed ----")
        }
        print("URL: \(request.baseURL)\(request.path)")
        print("Request Type: \(request.method.rawValue)")
        if let parameters = request.bodyParameters {
            print("Parameters: \(parameters)")
        } else {
            print("Parameters: None")
        }
        // Log additional error information if it failed
        if case .failure(let error) = result {
            switch error {
            case .connectionError(let connectionError):
                print("Connection Error: \(connectionError)")
            case .requestError(let requestError):
                print("Request Error: \(requestError)")
            case .responseError(let responseError):
                print("Response Error: \(responseError)")
            }
        }
    }
}
