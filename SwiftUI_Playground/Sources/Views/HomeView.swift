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
    @State private var isImagePickerPresented = false
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack(spacing: 28) {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .modifier(CustomImage(width: 300, height: 300))
            } else {
                Text("No image selected")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
            }
            Button("Select Image") {
                isImagePickerPresented.toggle()
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        }
        .fullScreenCover(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: $selectedImage)
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
