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
            .font(.largeTitle)
            .frame(width: 42, height: 12)
            .padding()
            .border(Color.black, width: 1.5)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .padding()
    }
}
