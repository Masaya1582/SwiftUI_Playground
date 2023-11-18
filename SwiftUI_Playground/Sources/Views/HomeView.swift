//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        ZStack {
            backgroundField()
            VStack(spacing: 8) {
                topField()
                middleField()
                bottomField()
            }
        }
        .fullScreenCover(isPresented: $viewModel.isOpenImagePicker) {
            ImagePicker(selectedImage: $viewModel.selectedImage, sourceType: viewModel.sourceType ?? .photoLibrary)
        }
        .sheet(isPresented: $viewModel.isShowHalfModalView) {
            HalfModalView(halfModalText: $viewModel.halfModalText, isShowHalfView: $viewModel.isShowHalfModalView)
                .presentationDetents([.medium])
        }
        .alert(isPresented: $viewModel.showSourceTypeAlert) {
            Alert(
                title: Text("Select SourceType"),
                message: nil,
                primaryButton: .default(Text("Camera")) {
                    viewModel.sourceType = .camera
                    viewModel.isOpenImagePicker = true
                },
                secondaryButton: .default(Text("Library")) {
                    viewModel.sourceType = .photoLibrary
                    viewModel.isOpenImagePicker = true
                }
            )
        }
    }

    @ViewBuilder
    private func topField() -> some View {
        Text("Today's Quote: \(viewModel.name)")
            .modifier(CustomLabel(foregroundColor: .black, size: 28))
        Text(viewModel.halfModalText)
            .modifier(CustomLabel(foregroundColor: .black, size: 20))
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
        .modifier(CustomButton(foregroundColor: .white, backgroundColor: .green))

        Button("Select an Image") {
            withAnimation {
                viewModel.showSourceTypeAlert = true
            }
        }
        .modifier(CustomButton(foregroundColor: .white, backgroundColor: .yellow))

        Button("Show HalfModalView") {
            withAnimation {
                viewModel.isShowHalfModalView = true
            }
        }
        .modifier(CustomButton(foregroundColor: .white, backgroundColor: .red))
    }

    @ViewBuilder
    private func backgroundField() -> some View {
        LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: .top, endPoint: .bottom)
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
