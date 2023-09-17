//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var shouldInvertColor = false
    @State private var name = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 4) {
            TextField("Your Name", text: $name)
                .modifier(TextFieldModifier(foregroundColor: .black, backgroundColor: .white))

            SecureField("Password", text: $password)
                .modifier(TextFieldModifier(foregroundColor: .black, backgroundColor: .white))
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
