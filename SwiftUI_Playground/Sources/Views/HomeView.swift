//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let favoriteMovies = [
        Movie(title: "Inception", genre: "Sci-Fi", description: "A skilled thief is given a chance at redemption if he can successfully perform an inception.", rating: 8.8, poster: "inception"),
        Movie(title: "The Dark Knight", genre: "Action", description: "Batman battles the Joker as he descends deeper into chaos.", rating: 9.0, poster: "dark_knight"),
        Movie(title: "Interstellar", genre: "Adventure", description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.", rating: 8.6, poster: "interstellar")
    ]

    var body: some View {
        NavigationView {
            List(favoriteMovies) { movie in
                MovieRowView(movie: movie)
            }
            .navigationTitle("Favorite Movies")
        }
    }

}

// MARK: - Movie Row View
struct MovieRowView: View {
    var movie: Movie

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // Movie Poster
            Image(movie.poster)
                .resizable()
                .frame(width: 80, height: 120)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 8) {
                // Movie Title
                Text(movie.title)
                    .font(.headline)
                    .fontWeight(.bold)

                // Movie Genre and Rating
                HStack {
                    Text(movie.genre)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(String(format: "%.1f", movie.rating))
                        .font(.subheadline)
                        .foregroundColor(.yellow)
                }

                // Movie Description
                Text(movie.description)
                    .font(.body)
                    .lineLimit(3)
                    .foregroundColor(.secondary)
            }
        }
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
