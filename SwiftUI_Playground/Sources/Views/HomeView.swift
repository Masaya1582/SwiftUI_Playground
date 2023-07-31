//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var overText = false

    var body: some View {
        Text("Hello, World!")
            .foregroundStyle(overText ? .green : .red)
            .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            .onHover { over in
                overText = over
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
