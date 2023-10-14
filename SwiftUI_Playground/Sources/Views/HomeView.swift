//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var cards: [Card] = [
        Card(color: Color.red, offset: 0),
        Card(color: Color.blue, offset: 0),
        Card(color: Color.green, offset: 0),
        Card(color: Color.yellow, offset: 0),
        Card(color: Color.red, offset: 0),
        Card(color: Color.blue, offset: 0),
        Card(color: Color.green, offset: 0),
        Card(color: Color.yellow, offset: 0),
        Card(color: Color.red, offset: 0),
        Card(color: Color.blue, offset: 0),
        Card(color: Color.green, offset: 0),
        Card(color: Color.yellow, offset: 0)
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(cards.indices, id: \.self) { index in
                    CardView(card: $cards[index])
                        .onTapGesture {
                            withAnimation {
                                cards[index].offset += 100
                            }
                        }
                }
            }
        }
        .padding()
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
