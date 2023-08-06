//
//  ImageUploadView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/08/05.
//

import SwiftUI
import UIKit
import AWSS3

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
        // Replace 'swiftui-cookie-monster-app-images' with the name of your S3 bucket
        let bucketName = "swiftui-cookie-monster-app-images"

        // Convert the UIImage to Data
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            return
        }

        // Set up the S3 upload request
        let transferUtility = AWSS3TransferUtility.default()
        let expression = AWSS3TransferUtilityUploadExpression()
        expression.progressBlock = { task, progress in
            // Handle progress updates if needed
            print("Upload progress: \(progress.fractionCompleted)")
        }

        transferUtility.uploadData(imageData,
                                   bucket: bucketName,
                                   key: UUID().uuidString, // Use a unique key for each image
                                   contentType: "image/jpeg",
                                   expression: expression) { task, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error uploading image: \(error.localizedDescription)")
                } else {
                    print("Image uploaded successfully.")
                }
            }
        }
    }
}


struct ImageUploadView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUploadView()
    }
}
