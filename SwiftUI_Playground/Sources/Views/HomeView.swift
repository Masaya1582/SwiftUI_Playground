//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var image: UIImage? = nil
    @State private var isLoading = false
    private let imageURL = "https://masasophi.com/wp-content/uploads/2023/05/swiftui_image.001.png"

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading Image...")
            } else if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("Image Not Available")
            }
        }
        .onAppear(perform: loadImage)
    }

    private func loadImage() {
        guard let url = URL(string: imageURL) else {
            return
        }
        isLoading = true
        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                isLoading = false
                if let data = data, let loadedImage = UIImage(data: data) {
                    image = loadedImage
                }
            }
        }.resume()
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
