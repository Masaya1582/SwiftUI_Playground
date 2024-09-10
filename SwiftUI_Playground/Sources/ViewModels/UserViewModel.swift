//
//  UserViewModel.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/09/10.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import Foundation
import Combine

final class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    func fetchUsers() {
        isLoading = true
        errorMessage = nil
        APIClient.request(UserRequest()) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.users = response.users
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
