//
//  CustomViews.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/20.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct FollowerRow: View {
    let follower: Follower
    @State private var image: Image = Image(systemName: "person.crop.circle")

    var body: some View {
        HStack {
            if let url = URL(string: follower.avatarURL) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        image
                    case .success(let loadedImage):
                        loadedImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    case .failure:
                        image
                    @unknown default:
                        image
                    }
                }
            } else {
                image // Show the default image if the URL is invalid
            }

            Text(follower.login)
                .padding(.leading, 10)

            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search followers...", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)

            Button(action: {
                text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(8)
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 4)
    }
}
