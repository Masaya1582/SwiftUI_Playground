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
    private let signUpManager = FirebaseAuthManager()

    var body: some View {
        VStack(spacing: 20) {
            Text("Signup")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
            TextField("Email", text: $viewModel.email)
                .modifier(CustomTextField())
            TextField("Password", text: $viewModel.password)
                .modifier(CustomTextField())
            Button {
                createUser()
            } label: {
                Text("Signup")
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Signup Status"), message: Text(viewModel.message), dismissButton: .default(Text("OK")))
        }
    }

    private func createUser() {
        if !viewModel.email.isEmpty && !viewModel.password.isEmpty {
            signUpManager.createUser(email: viewModel.email, password: viewModel.password) { success in
                if success {
                    viewModel.message = "User was successfully created."
                } else {
                    viewModel.message = "There was an error."
                }
                viewModel.showAlert = true
            }
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
