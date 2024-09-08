//
//  AuthManager.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2024/09/08.
//

import SwiftUI
import FirebaseAuth

final class AuthManager: ObservableObject {
    @Published var errorMessage: String?
    @Published var isLoggedIn = false

    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            } else {
                self?.isLoggedIn = true
                self?.errorMessage = nil
            }
        }
    }

    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            } else {
                self?.isLoggedIn = true
                self?.errorMessage = nil
            }
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            isLoggedIn = false
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
