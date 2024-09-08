//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @StateObject var authManager = AuthManager()

    var body: some View {
        VStack(spacing: 16) {
            if authManager.isLoggedIn {
                Text("ログイン成功！")
                Image("img_yoshi")
                    .resizable()
                    .frame(width: 300, height: 300)
                Button {
                    authManager.logout()
                } label: {
                    Text("ログアウト")
                }
            } else {
                TextField("メールアドレス", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                SecureField("パスワード", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button {
                    authManager.login(email: email, password: password)
                } label: {
                    Text("ログイン")
                }
                Button {
                    authManager.register(email: email, password: password)
                } label: {
                    Text("新規登録")
                }
            }
            if let errorMessage = authManager.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
