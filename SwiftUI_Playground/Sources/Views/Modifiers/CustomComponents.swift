//
//  CustomComponents.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/03.
//

import SwiftUI

// カスタムLabel
struct CustomLabel: ViewModifier {
    let foregroundColor: Color
    let size: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.custom(FontFamily.Caprasimo.regular, size: size))
            .foregroundColor(foregroundColor)
    }
}

// カスタムButton
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

// カスタムTextField
struct CustomTextField: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    let disableAutoCorrection: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.custom(FontFamily.Caprasimo.regular, size: 20))
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 1)
            )
            .disableAutocorrection(disableAutoCorrection)
            .padding()
    }
}

// カスタムImageView
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

// ビンテージスタイルのSettingView
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

// カスタムCircleView
struct CustomCircleView: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .scaleEffect(isAnimating ? 1.5 : 1.0)

            Image(systemName: "arrow.right.circle.fill")
                .font(.system(size: 50))
                .foregroundColor(.white)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
        }
        .onTapGesture {
            withAnimation(Animation.easeInOut(duration: 1.0)) {
                isAnimating.toggle()
            }
        }
    }
}

struct PulsatingCircleView: View {
    @State private var isPulsating = false

    var body: some View {
        Circle()
            .frame(width: isPulsating ? 150 : 100, height: isPulsating ? 150 : 100)
            .foregroundColor(.purple)
            .opacity(isPulsating ? 0.3 : 0.8)
            .animation(
                Animation.easeInOut(duration: 1.0)
                    .repeatForever(autoreverses: true)
            )
            .onAppear() {
                isPulsating.toggle()
            }
    }
}
