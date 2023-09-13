//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var presentAlert = false
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Username: \(username)")
                .font(.system(size: 28))
            Text("Password: \(password)")
                .font(.system(size: 28))
            Button {
                presentAlert = true
            } label: {
                Text("Show Alert")
                    .font(.system(size: 28))
            }
            .frame(width: 320, height: 60)
            .background(.orange)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 27))
            .padding()
        }
        .alert("Login", isPresented: $presentAlert, actions: {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            Button("Login", action: {})
            Button("Cancel", role: .cancel, action: {})
        }, message: {
            Text("Please enter your username and password.")
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
