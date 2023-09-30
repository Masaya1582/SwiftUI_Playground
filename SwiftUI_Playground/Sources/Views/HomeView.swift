//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let movies = [
        Movie(title: "Inception", poster: "inception"),
        Movie(title: "Interstellar", poster: "interstellar"),
        Movie(title: "The Dark Knight", poster: "darkknight"),
        Movie(title: "Blade Runner 2049", poster: "bladerunner2049"),
        Movie(title: "The Matrix", poster: "matrix")
    ]

    var body: some View {
        NavigationView {
            List(movies) { movie in
                NavigationLink(destination: Text(movie.title)) {
                    MovieRow(movie: movie)
                }
            }
            .navigationBarTitle("Favorite Movies")
        }
    }

}

struct MovieRow: View {
    let movie: Movie

    var body: some View {
        HStack {
            Image(movie.poster)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 150)
                .cornerRadius(10)

            Text(movie.title)
                .font(.title)
                .padding(.leading, 10)
                .foregroundColor(.primary)

            Spacer()
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(radius: 5)
        )
        .padding(.vertical, 5)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
