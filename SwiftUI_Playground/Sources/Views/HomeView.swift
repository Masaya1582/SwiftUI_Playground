//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoginSuccessful: Bool = false

    var body: some View {
        ZStack {
            Color.pink
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 28) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .padding(.bottom, 40)

                TextField("ID", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)

                Button(action: {
                    if username == "user" && password == "password" {
                        isLoginSuccessful = true
                    }
                }) {
                    Text("Login")
                        .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
                }
                .alert(isPresented: $isLoginSuccessful) {
                    Alert(title: Text("Login Successful"), message: Text("Welcome, \(username)!"), dismissButton: .default(Text("OK")))
                }

                Spacer()
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
