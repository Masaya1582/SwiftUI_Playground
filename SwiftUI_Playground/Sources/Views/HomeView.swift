//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import FirebaseStorage

struct HomeView: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var imageUrls: [URL] = []

    private let storage = Storage.storage()

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(imageUrls, id: \.self) { url in
                        AsyncImage(url: url) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 240, height: 240)
                            } else {
                                ProgressView()
                            }
                        }
                    }
                }
            }
            Button("画像を選択") {
                isImagePickerPresented = true
            }

            Button("画像をアップロード") {
                if let selectedImage = selectedImage {
                    uploadImage(image: selectedImage)
                }
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $selectedImage)
        }
        .onAppear {
            fetchImageUrls()
        }
    }

    // 画像をFirebase Storageにアップロード
    private func uploadImage(image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }

        let storageRef = storage.reference().child("images/\(UUID().uuidString).jpg")

        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Error uploading image: \(error)")
                return
            }

            storageRef.downloadURL { url, error in
                if let error = error {
                    print("Error getting download URL: \(error)")
                    return
                }

                if let url = url {
                    imageUrls.append(url)
                }
            }
        }
    }

    // 画像のURLをFirebase Storageから取得
    private func fetchImageUrls() {
        let storageRef = storage.reference().child("images")

        storageRef.listAll { result, error in
            if let error = error {
                print("Error listing images: \(error)")
                return
            }
            guard let items = result?.items else { return }
            for item in items {
                item.downloadURL { url, error in
                    if let error = error {
                        print("Error getting download URL: \(error)")
                        return
                    }
                    if let url = url {
                        imageUrls.append(url)
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
