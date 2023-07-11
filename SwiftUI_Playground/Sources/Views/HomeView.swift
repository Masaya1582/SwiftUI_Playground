//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var title = "Welcome"

    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
            // .toolbarRole(.editor)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
