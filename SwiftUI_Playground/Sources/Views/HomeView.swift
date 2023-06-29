//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var image: UIImage?
    @State private var showCameraView = false

    var body: some View {
        VStack {
            Text("Take a nice picture!")
                .font(.system(size: 30, weight: .bold))
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 400, height: 400)
            } else {
                Image(systemName: "figure.baseball")
                    .resizable()
                    .frame(width: 200, height: 250)
            }
            Button {
                showCameraView.toggle()
            } label: {
                Image(systemName: "camera.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 100)
            }
        }
        .fullScreenCover(isPresented: $showCameraView, content: {
            SwiftUIImagePicker(image: self.$image, showCameraView: self.$showCameraView)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
