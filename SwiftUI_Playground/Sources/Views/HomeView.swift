//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

// MARK: Album Model and Sample Data
struct Album: Identifiable {
    var id = UUID().uuidString
    var albumName: String
}

var albums: [Album] = [
    Album(albumName: "Alique's Song"),
    Album(albumName: "More"),
    Album(albumName: "Big Jet Plane"),
    Album(albumName: "Empty Floor"),
    Album(albumName: "Black Hole Nights"),
    Album(albumName: "Rain On Me"),
    Album(albumName: "Stuck With U"),
    Album(albumName: "7 rings"),
    Album(albumName: "Bang Bang"),
    Album(albumName: "In Between"),
    Album(albumName: "More"),
    Album(albumName: "Big Jet Plane"),
    Album(albumName: "Empty Floor"),
    Album(albumName: "Black Hole Nights"),
]

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            let safeArea = geometry.safeAreaInsets
            let size = geometry.size
            SocialMediaFeed(safeArea: safeArea, size: size)
                .ignoresSafeArea(.container, edges: .top)
        }
        .preferredColorScheme(.dark)
    }
}

struct SocialMediaFeed: View {
    var safeArea: EdgeInsets
    var size: CGSize

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                artWork(size: size)

                shareSongButton()
                    .padding(.top, 10)

                VStack(spacing: 15) {
                    ForEach(albums) { album in
                        spotifyLinkCard(album: album)
                    }
                }
                .padding(.top, 10)
            }
        }
    }

    @ViewBuilder
    func artWork(size: CGSize) -> some View {
        let height = size.height * 0.45
        Image("duck")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size.width, height: height)
            .clipped()
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }

    @ViewBuilder
    func shareSongButton() -> some View {
        Button("Share Your Song") {
            // Action to share a new song
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }

    @ViewBuilder
    func spotifyLinkCard(album: Album) -> some View {
        HStack {
            Image("duck")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(album.albumName)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)

                Text("Shared by @username")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: {
                // Action to play music
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
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
