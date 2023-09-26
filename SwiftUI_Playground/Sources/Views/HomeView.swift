//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            FlipCardView(englishWord: "Hello", spanishWord: "Hola")
                .padding()

            FlipCardView(englishWord: "Goodbye", spanishWord: "Adiós")
                .padding()
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
