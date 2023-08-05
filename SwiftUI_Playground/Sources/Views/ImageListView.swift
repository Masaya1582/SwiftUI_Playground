//
//  ImageListView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/08/05.
//

import SwiftUI

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
        // Implement code to fetch images from S3 using the AWS SDK
        // Populate the 'images' array with the downloaded images
    }
}


struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
        ImageListView()
    }
}
