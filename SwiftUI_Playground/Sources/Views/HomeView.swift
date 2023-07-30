//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userName = ""
    @State private var errorMessage = ""
    @State private var isLoginSuccessful = false

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("UserName", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button {
                signIn()
            } label: {
                Text("Login")
            }
            .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .orange))

            Button {
                createAccount()
            } label: {
                Text("Create Account")
            }
            .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .green))

            Text(errorMessage)
                .foregroundColor(.red)
        }
        .padding()
        .sheet(isPresented: $isLoginSuccessful) {
            PopupView()
        }
    }

    private func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                isLoginSuccessful = true
            }
        }
    }

    private func createAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("DEBUG_PRINT: " + error.localizedDescription)
                return
            }
            print("DEBUG_PRINT: ユーザー作成に成功しました。")
            // 表示名を設定する
            let user = Auth.auth().currentUser
            if let user = user {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = userName
                changeRequest.commitChanges { error in
                    if let error = error {
                        // プロフィールの更新でエラーが発生
                        print("DEBUG_PRINT: " + error.localizedDescription)
                        return
                    }
                    guard let userName = user.displayName else { return }
                    print("DEBUG_PRINT: [displayName = \(userName)]の設定に成功しました。")
                    // self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
