// 
//  UsersViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Alamofire

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    let url = "https://jsonplaceholder.typicode.com/users"

    func fetchUsersWithURLSession() {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
            if let data = data {
                do {
                    let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                    DispatchQueue.main.async {
                        self.users = decodedUsers
                    }
                } catch {
                    print("Error decoding users: \(error)")
                }
            }
        }.resume()
    }

    func fetchUsersWithAlamofire() {
        AF.request(url).responseDecodable(of: [User].self) { response in
            if let users = response.value {
                DispatchQueue.main.async {
                    self.users = users
                }
            }
        }
    }
}
