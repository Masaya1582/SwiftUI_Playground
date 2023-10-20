//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .modifier(CustomImage(width: 240, height: 240))
            } else {
                Text("No image selected")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
            }
            Button {
                withAnimation {
                    isImagePickerPresented = true
                }
            } label: {
                Text("Open Camera")
                    .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            AlbumPicker(selectedImage: $selectedImage, sourceType: .camera)
            // AlbumPicker(selectedImage: $selectedImage, sourceType: .photoLibrary)
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
