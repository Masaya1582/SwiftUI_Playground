//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var photos = [
        Photo(imageName: "img_biden"),
        Photo(imageName: "img_barack"),
        Photo(imageName: "img_donald"),
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 200))]) {
                    ForEach(photos) { photo in
                        Image(photo.imageName)
                            .resizable()
                            .scaledToFit()
                            .onTapGesture {
                                withAnimation {
                                    toggleZoom(for: photo)
                                }
                            }
                            .frame(width: photo.isZoomed ? UIScreen.main.bounds.width - 40 : nil,
                                   height: photo.isZoomed ? nil : 150)
                            .border(Color.primary.opacity(0.5))
                            .cornerRadius(photo.isZoomed ? 0 : 15)
                    }
                }
                .padding(20)
            }
            .navigationTitle("Photo Gallery")
        }
    }

    private func toggleZoom(for photo: Photo) {
        if let index = photos.firstIndex(where: { $0.id == photo.id }) {
            photos[index].isZoomed.toggle()
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
