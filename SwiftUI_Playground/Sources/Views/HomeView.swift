//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        VStack(spacing: 28) {
            Text("Dio said: \(viewModel.name)")
                .font(.custom(FontFamily.Caprasimo.regular, size: 28))
            TextField("Message", text: $viewModel.name)
                .modifier(CustomTextField())
            if viewModel.shouldInvertColor {
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
                    .modifier(CustomImage(width: 200, height: 200))
            }
            Button {
                viewModel.shouldInvertColor.toggle()
            } label: {
                Text(viewModel.shouldInvertColor ? "Revert Color" : "Invert Color")
                    .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
            }
            Spacer().frame(height: 80)
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
