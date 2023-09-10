//
//  CardView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/09/10.
//

import SwiftUI

struct CardView: View {
    let card: Card

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(card.color)
            .frame(width: 150, height: 150)
    }
}
