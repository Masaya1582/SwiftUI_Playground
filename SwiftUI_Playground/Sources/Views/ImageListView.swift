//
//  ImageListView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/08/05.
//

import SwiftUI
import AWSS3

struct ImageListView: View {
    @State private var images: [ImageModel] = []

    var body: some View {
        NavigationView {
            List(images, id: \.id) { image in
                Image(uiImage: image.uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
            }
            .navigationBarTitle("Image List")
        }
        .onAppear {
            fetchImagesFromS3()
        }
    }

    func fetchImagesFromS3() {
        // Replace 'swiftui-cookie-monster-app-images' with the name of your S3 bucket
        let bucketName = "swiftui-cookie-monster-app-images"

        let listRequest = AWSS3ListObjectsV2Request()
        listRequest!.bucket = bucketName

        // Fetch the list of objects (images) from the S3 bucket
        AWSS3.default().listObjectsV2(listRequest!).continueWith { task in
            if let error = task.error {
                print("Error fetching images from S3: \(error.localizedDescription)")
            } else if let result = task.result {
                // Clear the existing images array before populating it with the fetched images
                DispatchQueue.main.async {
                    self.images.removeAll()
                }

                // Process the fetched objects (images)
                for s3Object in result.contents ?? [] {
                    let getObjectRequest = AWSS3GetObjectRequest()
                    getObjectRequest!.bucket = bucketName
                    getObjectRequest!.key = s3Object.key

                    // Fetch each image from S3
                    AWSS3.default().getObject(getObjectRequest!).continueWith { getObjectTask in
                        if let getObjectError = getObjectTask.error {
                            print("Error fetching object from S3: \(getObjectError.localizedDescription)")
                        } else if let getObjectResult = getObjectTask.result {
                            if let imageData = getObjectResult.body as? Data,
                               let uiImage = UIImage(data: imageData) {
                                // Create and add the ImageModel to the images array
                                DispatchQueue.main.async {
                                    self.images.append(ImageModel(uiImage: uiImage))
                                }
                            }
                        }
                        return nil
                    }
                }
            }
            return nil
        }
    }
}

struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
        ImageListView()
    }
}
