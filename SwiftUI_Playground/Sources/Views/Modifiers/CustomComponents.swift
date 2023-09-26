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
    let width: CGFloat
    let height: CGFloat

    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.black, lineWidth: 2)
            )
    }
}

struct VintageSettingView: View {
    var iconName: String
    var title: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.system(size: 28))
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 20))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}

struct FlipCardView: View {
    @State private var isFlipped = false
    let englishWord: String
    let spanishWord: String

    var body: some View {
        VStack {
            if isFlipped {
                Text(spanishWord)
                    .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            } else {
                Text(englishWord)
                    .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            }
            Button {
                withAnimation {
                    isFlipped.toggle()
                }
            } label: {
                Text(isFlipped ? "Show English" : "Show Spanish")
            }
            .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 28, alignment: .center)
            .padding()
            .foregroundColor(.white)
            .background(.orange)
            .clipShape(RoundedRectangle(cornerRadius: 27))
            .padding()
        }
        .rotation3DEffect(
            .degrees(isFlipped ? 180 : 0),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}
