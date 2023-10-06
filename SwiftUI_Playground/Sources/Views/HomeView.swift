//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum LoginError: Error {
    case emptyFields
    case invalidCredentials
}

struct HomeView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""


    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))

                TextField("Username", text: $username)
                    .modifier(CustomTextField(disableAutoCorrection: false))

                SecureField("Password", text: $password)
                    .modifier(CustomTextField(disableAutoCorrection: false))

                Button {
                    login()
                } label: {
                    Text("Log In")
                        .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    private func login() {
        do {
            // usernameかpasswordが空ではないことをチェック
            guard !username.isEmpty, !password.isEmpty else {
                throw LoginError.emptyFields
            }

            // usernameとpasswordが合っているかどうかチェック
            guard username == "Masaya" && password == "Masaya1234" else {
                throw LoginError.invalidCredentials
            }

            // 条件を満たせば、成功アラートを出す
            showAlert = true
            alertMessage = "Login successful!"
        } catch {
            // エラーが起きた場合は、それをCatch (キャッチ)する
            // エラーメッセージを表示
            showAlert = true
            alertMessage = error.localizedDescription
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
