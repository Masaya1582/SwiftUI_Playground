//
//  FollowerDetailView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/20.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct FollowerDetailView: View {
    let avatarURL: String
    let userName: String

    var body: some View {
        VStack(spacing: 32) {
            AsyncImage(url: URL(string: avatarURL)) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "person.crop.circle")
                case .success(let loadedImage):
                    loadedImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                case .failure:
                    Image(systemName: "person.crop.circle")
                @unknown default:
                    Image(systemName: "person.crop.circle")
                }
            }
            .frame(width: 200, height: 200)
            Text(userName)
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            Spacer().frame(height: 240)
        }
        .navigationBarTitle("Follower")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FollowerDetailView_Previews: PreviewProvider {
    @State static var image = Image(systemName: "car")
    static var previews: some View {
        FollowerDetailView(avatarURL: "https://avatars.githubusercontent.com/u/74645651?s=96&v=4", userName: "Masaya1582")
    }
}
