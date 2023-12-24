//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 2) {
                    ForEach(0..<30, id: \.self) { index in
                        ImageLoaderView(urlString: "https://source.unsplash.com/random?sig=\(index)")
                            .aspectRatio(1, contentMode: .fill)
                            .clipped()
                    }
                }
            }
            .navigationTitle("Photo Gallery")
            .navigationBarItems(trailing: Button(action: {}) {
                Image(systemName: "plus")
                    .foregroundColor(.black)
            })
        }
    }
}

struct ImageLoaderView: View {
    let urlString: String

    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
