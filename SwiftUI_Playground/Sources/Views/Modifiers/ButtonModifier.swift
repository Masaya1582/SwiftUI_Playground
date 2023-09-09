//
//  ButtonModifier.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/03.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    let foregroundColor: Color
    let backgroundColor: Color

    func body(content: Content) -> some View {
        content
            .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 28, alignment: .center)
            .padding()
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .padding()
    }
}

struct FancyListRow: View {
    var item: String // Customize this based on your data model

    var body: some View {
        VStack {
            Text(item)
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

