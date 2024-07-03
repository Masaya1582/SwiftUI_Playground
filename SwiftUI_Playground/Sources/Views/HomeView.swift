//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let posts = [
        Post(username: "John Doe", profileImage: "img_george_w", postImage: "img_burger", caption: "This is a sample caption for the post", timeAgo: "2 hours ago"),
        Post(username: "Jane Smith", profileImage: "img_donald", postImage: "img_spaghetti", caption: "Another sample caption for the post", timeAgo: "4 hours ago")
    ]

    var body: some View {
        ScrollView {
            VStack {
                ForEach(posts) { post in
                    PostView(post: post)
                }
            }
        }
    }
}

struct PostView: View {
    var post: Post

    var body: some View {
        VStack(alignment: .leading) {
            // User Info
            HStack {
                Image(post.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                VStack(alignment: .leading) {
                    Text(post.username)
                        .font(.headline)
                    Text(post.timeAgo)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Button(action: {
                    // Action for more options
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                }
            }
            .padding([.leading, .trailing, .top], 15)

            // Post Image
            Image(post.postImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .clipped()

            // Post Caption
            Text(post.caption)
                .font(.body)
                .padding([.leading, .trailing], 15)
                .padding(.top, 5)

            // Action Buttons
            HStack {
                Button(action: {
                    // Like action
                }) {
                    Image(systemName: "heart")
                        .font(.title)
                        .padding()
                }
                Button(action: {
                    // Comment action
                }) {
                    Image(systemName: "message")
                        .font(.title)
                        .padding()
                }
                Button(action: {
                    // Share action
                }) {
                    Image(systemName: "paperplane")
                        .font(.title)
                        .padding()
                }
                Spacer()
            }
            .padding([.leading, .trailing, .bottom], 10)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding([.leading, .trailing, .top])
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
    }
}
