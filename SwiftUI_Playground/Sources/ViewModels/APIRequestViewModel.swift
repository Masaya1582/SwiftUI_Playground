// 
//  APIRequestViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class APIRequestViewModel: ObservableObject {
    @Published var requestStatus: RequestStatus = .idle

    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
            return
        }

        requestStatus = .loading

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.requestStatus = .failure(error)
                } else if let data = data {
                    self.requestStatus = .success
                } else {
                    self.requestStatus = .failure(NSError(domain: "App", code: 1, userInfo: nil))
                }
            }
        }.resume()
    }
}
