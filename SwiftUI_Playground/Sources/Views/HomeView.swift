//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Image(colorScheme == .dark ? "img_black" : "img_white")
                .resizable()
                .frame(width: 200, height: 200)
            Text(colorScheme == .dark ? "In dark mode" : "In light mode")
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
