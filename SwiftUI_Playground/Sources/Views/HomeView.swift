//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // Search Bar
                    HStack {
                        TextField("Search", text: $searchText)
                            .padding(7)
                            .padding(.horizontal, 25)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 8)

                                    if !searchText.isEmpty {
                                        Button(action: {
                                            self.searchText = ""
                                        }) {
                                            Image(systemName: "multiply.circle.fill")
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 8)
                                        }
                                    }
                                }
                            )
                            .padding(.horizontal, 10)

                        Button(action: {}) {
                            Image(systemName: "camera")
                                .foregroundColor(.black)
                        }
                    }
                    .padding()

                    // Stories
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(0..<5) { _ in
                                VStack {
                                    RemoteImage(url: "https://source.unsplash.com/random")
                                        .scaledToFill()
                                        .frame(width: 120, height: 200)
                                        .clipped()
                                        .cornerRadius(10)

                                    Text("Your Story")
                                        .font(.caption)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Posts
                    ForEach(0..<10) { _ in
                        VStack(alignment: .leading) {
                            // Header
                            HStack {
                                RemoteImage(url: "https://source.unsplash.com/random")
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .cornerRadius(25)

                                VStack(alignment: .leading) {
                                    Text("Username")
                                        .font(.headline)
                                    Text("Location")
                                        .font(.subheadline)
                                }
                                Spacer()
                                Button(action: {}) {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.horizontal)

                            // Post Image
                            RemoteImage(url: "https://source.unsplash.com/random")
                                .scaledToFill()
                                .frame(height: 300)
                                .clipped()

                            // Buttons
                            HStack(spacing: 15) {
                                Button(action: {}) {
                                    Image(systemName: "hand.thumbsup")
                                        .foregroundColor(.black)
                                }
                                Button(action: {}) {
                                    Image(systemName: "bubble.right")
                                        .foregroundColor(.black)
                                }
                                Button(action: {}) {
                                    Image(systemName: "paperplane")
                                        .foregroundColor(.black)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)

                            // Caption
                            Text("Liked by someone and others")
                                .font(.caption)
                                .padding(.horizontal)
                            Text("View all comments")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        }
                        .padding(.bottom)
                    }
                }
            }
            .navigationTitle("Facebook")
        }
    }
}

// RemoteImage View for loading images from URLs
struct RemoteImage: View {
    let url: String
    @State private var image: UIImage? = nil

    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else {
                Rectangle()
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            loadImage(from: url)
        }
    }

    private func loadImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        URLSession.shared.dataTask(with: imageURL) { data, _, _ in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
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
