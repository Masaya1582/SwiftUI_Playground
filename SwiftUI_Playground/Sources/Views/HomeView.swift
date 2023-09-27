//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var text = "Hello World"
    @State private var isCopied = false

    var body: some View {
        VStack {
            Text(text)
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            Button {
                UIPasteboard.general.string = text
                isCopied = true
            } label: {
                Text(isCopied ? "Copied" : "Copy Text")
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
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
