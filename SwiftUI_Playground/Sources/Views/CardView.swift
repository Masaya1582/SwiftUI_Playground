//
//  CardView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/09/18.
//

import SwiftUI

struct CardView<Content>: View where Content: View {
    let color: Color
    let radius: CGFloat
    let content: () -> Content

    init(
        color: Color = Color.gray.opacity(0.4),
        radius: CGFloat = 8,
        @ViewBuilder content: @escaping () -> Content) {
            self.content = content
            self.color = color
            self.radius = radius
        }

    var body: some View {
        content()
            .padding(16)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: color, radius: radius, x: 4, y: 4)
            .padding(radius + 8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView {
            Text("Jonny")
        }
        .previewLayout(.sizeThatFits)
    }
}
