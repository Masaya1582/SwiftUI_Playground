//
//  CustomModifier.swift
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

/// 各タブアイテムのView
struct TabItemView: View {
    @Binding var presentSideMenu: Bool
    let title: String

    var body: some View {
        VStack {
            HStack {
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            Spacer()
            Text(title)
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            Spacer()
        }
    }
}
