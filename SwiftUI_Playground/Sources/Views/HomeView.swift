//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        SNSPostView()
    }
}

struct SNSPostView: View {
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Social Network")
                    .font(.title)
                    .fontWeight(.bold)

                Spacer()

                Image(systemName: "plus.square")
                    .font(.title)

                Image(systemName: "heart")
                    .font(.title)

                Image(systemName: "paperplane")
                    .font(.title)
            }
            .padding()

            // Posts
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<10) { _ in
                        PostView()
                    }
                }
                .padding()
            }

            // Tab Bar
            HStack {
                Image(systemName: "house.fill")
                    .font(.title)

                Spacer()

                Image(systemName: "magnifyingglass")
                    .font(.title)

                Spacer()

                Image(systemName: "plus.square")
                    .font(.title)

                Spacer()

                Image(systemName: "heart")
                    .font(.title)

                Spacer()

                Image(systemName: "person")
                    .font(.title)
            }
            .padding()
        }
    }
}

struct PostView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                Text("username")
                    .font(.headline)

                Spacer()

                Image(systemName: "ellipsis")
                    .font(.title)
            }

            ImageLoaderView(urlString: "https://source.unsplash.com/random")
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()

            HStack(spacing: 20) {
                Image(systemName: "heart")
                    .font(.title)

                Image(systemName: "bubble.right")
                    .font(.title)

                Image(systemName: "paperplane")
                    .font(.title)

                Spacer()

                Image(systemName: "bookmark")
                    .font(.title)
            }

            Text("Liked by username and 1,234 others")
                .font(.caption)

            Text("Caption text goes here")
                .font(.body)

            Text("View all 123 comments")
                .font(.caption)
                .foregroundColor(.gray)

            Text("2 hours ago")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct ImageLoaderView: View {
    let urlString: String

    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image.resizable()
        } placeholder: {
            Color.gray
        }
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
