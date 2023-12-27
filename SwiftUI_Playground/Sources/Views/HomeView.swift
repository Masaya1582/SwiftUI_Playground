//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Search Bar
                    HStack {
                        TextField("Search Twitter", text: $searchText)
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
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 8)
                                        }
                                    }
                                }
                            )
                            .padding(.horizontal, 10)
                    }
                    .padding()

                    // Tweets
                    ForEach(0..<10) { _ in
                        TweetCell()
                    }
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "sparkles")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct TweetCell: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            RemoteImage(url: "https://source.unsplash.com/random/100x100?face")
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Username")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("@handle")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("2h")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Text("Tweet text goes here. This is the main content of the tweet, which can span multiple lines.")
                    .foregroundColor(.black)
            }
        }
        .padding()
        .overlay(
            Divider()
                .padding(.leading, 65),
            alignment: .bottom
        )
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
