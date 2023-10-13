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
        ZStack {
            if viewModel.isFloatingViewVisible {
                FloatingView(dismissAction: {
                    withAnimation {
                        viewModel.isFloatingViewVisible = false
                    }
                })
                .transition(.asymmetric(insertion: .opacity, removal: .opacity))
                .zIndex(1)
            }
            VStack(spacing: 28) {
                Text("Dio said: \(viewModel.name)")
                    .modifier(CustomLabel(foregroundColor: .black, size: 28))
                TextField("Messages", text: $viewModel.name)
                    .modifier(CustomTextField(disableAutoCorrection: true))
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
                    withAnimation {
                        viewModel.shouldInvertColor.toggle()
                        viewModel.isFloatingViewVisible = true
                    }
                } label: {
                    Text(viewModel.shouldInvertColor ? "Revert Color" : "Invert Color")
                        .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
                }
                CustomCircleView()
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
