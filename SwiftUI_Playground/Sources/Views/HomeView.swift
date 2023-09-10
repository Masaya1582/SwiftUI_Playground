//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let cards = Card.allCards
    @State private var selectedCard: Card?

    var body: some View {
        VStack {
            Text("Horizontal Scroll View with Animation")
                .font(.custom(FontFamily.Caprasimo.regular, size: 16))
                .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(cards) { card in
                        CardView(card: card)
                            .scaleEffect(selectedCard == card ? 1.2 : 1.0)
                            .onTapGesture {
                                withAnimation {
                                    selectedCard = card
                                }
                            }
                    }
                }
                .padding(20)
            }
            .frame(height: 200)

            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
