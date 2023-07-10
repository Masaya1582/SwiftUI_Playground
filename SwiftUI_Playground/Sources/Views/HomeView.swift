//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var userName: String = ""
    var body: some View {
        VStack(spacing: 20) {
            TextField("Username", text: $userName)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button {

            } label: {
                Text("Button")
                    .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: userName.isEmpty ? .gray.opacity(0.3) : .green))
            }
            .disabled(userName.isEmpty)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
