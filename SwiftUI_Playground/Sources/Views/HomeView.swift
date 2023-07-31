//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var password = ""
    @State private var statusText = ""

    var body: some View {
        VStack {
            SecureField("Password", text: $password)
                .onSubmit {
                    statusText = "Authenticating…"
                }
                .padding()

            Text(statusText)
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
