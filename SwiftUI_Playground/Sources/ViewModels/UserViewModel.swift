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
    @Published var user: User?
    @Published var isLoading = false

    func fetchUsers(id: Int) {
        isLoading = true
        APIClient.request(UserRequest(id: id)) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    self?.user = response
                    print("ユーザ情報: \(response)")
                case .failure(let error):
                    print("エラーだよ: \(error.localizedDescription)")
                }
            }
        }
    }
}
