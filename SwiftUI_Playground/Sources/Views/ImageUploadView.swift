//
//  ImageUploadView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/08/05.
//

import SwiftUI
import UIKit

struct ImageUploadView: View {
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
            }
            Button("Select Image") {
                showImagePicker = true
            }
            .padding()
            .sheet(isPresented: $showImagePicker) {
                ImagePickerView(selectedImage: $selectedImage)
            }
            Button("Upload Image") {
                if let image = selectedImage {
                    uploadImageToS3(image: image)
                }
            }
        }
    }

    func uploadImageToS3(image: UIImage) {
        // Implement code to upload the selected image to S3 using the AWS SDK
        // You can use the same 'uploadImageToS3' function as mentioned in the previous response
    }
}


struct ImageUploadView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUploadView()
    }
}
