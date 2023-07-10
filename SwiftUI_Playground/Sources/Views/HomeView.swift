//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isButtonDisabled = false
    var body: some View {
        VStack(spacing: 20) {
            Text("Dio")
                .font(.custom(FontFamily.Caprasimo.regular, size: 42))
            Asset.Assets.imgDio.swiftUIImage
                .resizable()
                .frame(width: 320, height: 280)
            Button {
                isButtonDisabled = isButtonDisabled ? false : true
            } label: {
                Text("Button")
                    .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: isButtonDisabled ? .gray.opacity(0.3) : .green))
            }
            .disabled(isButtonDisabled)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
