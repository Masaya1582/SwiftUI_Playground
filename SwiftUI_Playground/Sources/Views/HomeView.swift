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
            VStack(spacing: 16) {
                Text("Today's Quote: \(viewModel.name)")
                    .modifier(CustomLabel(foregroundColor: .black, size: 28))
                TextField("Quote", text: $viewModel.name)
                    .modifier(CustomTextField())
                if let image = viewModel.selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .modifier(CustomImage(width: 200, height: 200))
                } else {
                    Asset.Assets.imgDio.swiftUIImage
                        .resizable()
                        .modifier(CustomImage(width: 200, height: 200))
                }
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
                CustomCircleView()
            }
        }
        .fullScreenCover(isPresented: $viewModel.isOpenImagePicker) {
            ImagePicker(selectedImage: $viewModel.selectedImage, sourceType: viewModel.sourceType ?? .photoLibrary)
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
