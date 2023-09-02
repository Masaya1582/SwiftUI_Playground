// 
//  UserViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        fetchData()
    }

    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = decodedResponse
                    }
                    return
                }
            }
        }
        task.resume()
    }
}
