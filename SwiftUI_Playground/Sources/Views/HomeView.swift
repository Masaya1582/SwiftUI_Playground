//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    let sportsData = [
        ("Basketball", "https://unsplash.com/photos/PO7CGnoDFUI"),
        ("Football", "https://unsplash.com/photos/6jYoil2GhVk"),
        ("Baseball", "https://unsplash.com/photos/8qD4wYi6w0s"),
        ("Soccer", "https://unsplash.com/photos/kj2t5HdZq2g")
    ]

    let columns = [
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: columns, spacing: 20) {
                ForEach(sportsData, id: \.0) { sport in
                    VStack {
                        SportImageView(url: sport.1)
                            .frame(width: 100, height: 100)
                            .cornerRadius(50)

                        Text(sport.0)
                            .font(.headline)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct SportImageView: View {
    let url: String

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipped()
            case .failure(_):
                Asset.Assets.imgYoshi.swiftUIImage
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipped()
            case .empty:
                ProgressView()
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 100, height: 100)
        .cornerRadius(50)
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
