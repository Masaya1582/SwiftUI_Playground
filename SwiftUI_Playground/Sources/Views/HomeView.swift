//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var isRotating = false

    var body: some View {
        Image(systemName: "apple.logo")
            .font(.system(size: 100))
            .foregroundColor(.blue)
            .rotationEffect(.degrees(isRotating ? 360 : 0))
            .animation(
                Animation.linear(duration: 2)
                    .repeatForever(autoreverses: false)
            )
            .onAppear() {
                isRotating = true
            }
    }

    @ViewBuilder
    private func topField() -> some View {
        Text("Today's Quote: \(viewModel.name)")
            .modifier(CustomLabel(foregroundColor: .black, size: 28))
        TextField("Quote", text: $viewModel.name)
            .modifier(CustomTextField())
    }

    @ViewBuilder
    private func middleField() -> some View {
        if let image = viewModel.selectedImage {
            Image(uiImage: image)
                .resizable()
                .modifier(CustomImage(width: 200, height: 200))
        } else {
            Asset.Assets.imgDio.swiftUIImage
                .resizable()
                .modifier(CustomImage(width: 200, height: 200))
        }
    }

    @ViewBuilder
    private func bottomField() -> some View {
        Button("Show Popup View") {
            withAnimation {
                viewModel.isFloatingViewVisible = true
            }
        }
        .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))

        Button("Select an Image") {
            withAnimation {
                viewModel.showSourceTypeAlert = true
            }
        }
        .modifier(CustomButton(foregroundColor: .white, backgroundColor: .green))
    }

    @ViewBuilder
    private func backgroundField() -> some View {
        LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
        if viewModel.isFloatingViewVisible {
            FloatingView(dismissAction: {
                withAnimation {
                    viewModel.isFloatingViewVisible = false
                }
            })
            .transition(.asymmetric(insertion: .opacity, removal: .opacity))
            .zIndex(1)
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
