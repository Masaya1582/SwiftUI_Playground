//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var cards: [Card] = [
        Card(color: .red),
        Card(color: .green),
        Card(color: .blue),
        Card(color: .orange),
        Card(color: .purple),
        Card(color: .pink),
        Card(color: .red),
        Card(color: .green),
        Card(color: .blue),
        Card(color: .orange),
        Card(color: .purple),
        Card(color: .pink),
        Card(color: .red),
        Card(color: .green),
        Card(color: .blue),
        Card(color: .orange),
        Card(color: .purple),
        Card(color: .pink),
        Card(color: .red),
        Card(color: .green),
        Card(color: .blue),
        Card(color: .orange),
        Card(color: .purple),
        Card(color: .pink),
        Card(color: .purple),
        Card(color: .pink),
        Card(color: .yellow)
    ]

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ScrollViewReader { proxy in
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 20) {
                            ForEach(cards) { card in
                                Rectangle()
                                    .fill(card.color)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                    .id(card.id)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Scroll to Card")
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
