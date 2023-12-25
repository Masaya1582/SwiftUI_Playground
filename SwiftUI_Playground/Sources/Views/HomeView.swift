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
                VStack(alignment: .leading, spacing: 10) {

                    Text("Stories")
                        .font(.system(size: 20))
                        .foregroundColor(.primary)
                        .padding(.leading)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0..<10, id: \.self) { _ in
                                VStack {
                                    ImageLoader.loadPlaceholderImage()
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.gray.opacity(0.9), lineWidth: 1.5))

                                    Text("Username")
                                        .font(.system(size: 12))
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    ForEach(0..<10, id: \.self) { _ in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                ImageLoader.loadPlaceholderImage()
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray.opacity(0.9), lineWidth: 1.5))

                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Username")
                                        .font(.system(size: 17, weight: .medium))
                                        .foregroundColor(.primary)

                                    Text("Location")
                                        .font(.system(size: 12))
                                        .foregroundColor(.secondary)
                                }

                                Spacer()

                                Button(action: {}) {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.primary)
                                }
                            }

                            ImageLoader.loadPlaceholderImage()
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .clipped()

                            HStack {
                                Button(action: {}) {
                                    Image(systemName: "heart")
                                        .foregroundColor(.primary)
                                }

                                Button(action: {}) {
                                    Image(systemName: "bubble.right")
                                        .foregroundColor(.primary)
                                }

                                Button(action: {}) {
                                    Image(systemName: "paperplane")
                                        .foregroundColor(.primary)
                                }

                                Spacer()

                                Button(action: {}) {
                                    Image(systemName: "bookmark")
                                        .foregroundColor(.primary)
                                }
                            }
                            .padding(.vertical)

                            Text("Liked by username and others")
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(.primary)

                            Text("Caption")
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(.primary)

                            Text("View all comments")
                                .font(.system(size: 12))
                                .foregroundColor(.secondary)

                            Text("2 hours ago")
                                .font(.system(size: 12))
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarTitle("Instagram", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {}) {
                Image(systemName: "camera")
                    .foregroundColor(.primary)
            }, trailing: Button(action: {}) {
                Image(systemName: "paperplane")
                    .foregroundColor(.primary)
            })
        }
    }
}

struct ImageLoader {
    static func loadPlaceholderImage() -> Image {
        guard let url = URL(string: "https://source.unsplash.com/random"),
              let imageData = try? Data(contentsOf: url),
              let uiImage = UIImage(data: imageData) else {
            return Image(systemName: "photo")
        }
        return Image(uiImage: uiImage)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
