//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let symbols: [String] = [
        "heart.fill",
        "star.fill",
        "circle.fill",
        "square.fill",
        "pencil",
        "person.fill",
        "book.fill",
        "cloud.fill",
        "scribble",
        "applewatch"
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 20) {
                ForEach(symbols, id: \.self) { symbolName in
                    IconView(symbolName: symbolName)
                }
            }
            .padding()
        }
    }
}

struct IconView: View {
    let symbolName: String

    var body: some View {
        VStack {
            Image(systemName: symbolName)
                .font(.system(size: 40))
                .padding(10)
                .background(Color.blue)
                .clipShape(Circle())
                .foregroundColor(.white)
                .shadow(radius: 5)

            Text(symbolName)
                .font(.caption)
                .multilineTextAlignment(.center)
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
