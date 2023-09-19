//
//  CustomComponents.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/03.
//

import SwiftUI

struct CustomButton: ViewModifier {
    let foregroundColor: Color
    let backgroundColor: Color

    func body(content: Content) -> some View {
        content
            .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 28, alignment: .center)
            .padding()
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 27))
            .padding()
    }
}

struct CustomTextField: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content
            .font(.custom(FontFamily.Caprasimo.regular, size: 20))
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 1)
            )
            .padding()
    }
}

struct CustomImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.black, lineWidth: 2)
            )
    }
}
