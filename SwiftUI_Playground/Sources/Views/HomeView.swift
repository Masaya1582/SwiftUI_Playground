//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    private let loginManager = FirebaseAuthManager()

    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
            TextField("Email", text: $viewModel.email)
                .modifier(CustomTextField())
            TextField("Password", text: $viewModel.password)
                .modifier(CustomTextField())
            Button {
                loginUser()
            } label: {
                Text("Login")
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: viewModel.buttonColor))
            .disabled(!viewModel.isLoginButtonEnabled)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Login Status"), message: Text(viewModel.message), dismissButton: .default(Text("OK")))
        }
    }

    private func loginUser() {
        loginManager.loginUser(email: viewModel.email, password: viewModel.password) { success in
            if success {
                viewModel.message = "Login was successful."
            } else {
                viewModel.message = "Login failed. Email or Password are wrong"
            }
            viewModel.showAlert = true
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
