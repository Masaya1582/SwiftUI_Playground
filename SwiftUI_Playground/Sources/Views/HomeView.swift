//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var shouldInvertColor = false

    var body: some View {
        VStack(spacing: 28) {
            Text("Dio")
                .font(.custom(FontFamily.Caprasimo.regular, size: 42))
            if shouldInvertColor {
                Asset.Assets.imgDio.swiftUIImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .colorInvert()
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 2)
                    )
            } else {
                Asset.Assets.imgDio.swiftUIImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 2)
                    )
            }
            Button {
                shouldInvertColor.toggle()
            } label: {
                Text(shouldInvertColor ? "Revert Color" : "Invert Color")
                    .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .orange))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }

    }
}
