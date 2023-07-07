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
        Button("Show Alert") {
            presentAlert = true
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
