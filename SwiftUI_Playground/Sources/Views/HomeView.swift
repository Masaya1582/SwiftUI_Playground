//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    // Whatever text the user has typed so far.
    @State private var searchText = ""

    // All possible tokens we want to show to the user.
    private let allTokens = [Token(name: "Action"), Token(name: "Comedy"), Token(name: "Drama"), Token(name: "Family"), Token(name: "Sci-Fi")]

    // The list of tokens the user currently has selected.
    @State private var currentTokens = [Token]()

    // The list of tokens we want to show to the user right now. Activates token selection only when searchText starts with #.
    var suggestedTokens: [Token] {
        if searchText.starts(with: "#") {
            return allTokens
        } else {
            return []
        }
    }

    // Some data to show and filter by.
    private let movies = [
        Movie(name: "Avatar", genre: "Sci-Fi"),
        Movie(name: "Inception", genre: "Sci-Fi"),
        Movie(name: "Love Actually", genre: "Comedy"),
        Movie(name: "Paddington", genre: "Family")
    ]

    // The real work: filter all the movies based on search text or tokens.
    var searchResults: [Movie] {
        // trim whitespace
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespaces)

        return movies.filter { movie in
            if searchText.isEmpty == false {
                // If we have search text, make sure this item matches.
                if movie.name.localizedCaseInsensitiveContains(trimmedSearchText) == false {
                    return false
                }
            }

            if currentTokens.isEmpty == false {
                // If we have search tokens, loop through them all to make sure one of them matches our movie.
                for token in currentTokens {
                    if token.name.localizedCaseInsensitiveContains(movie.genre) {
                        return true
                    }
                }

                // This movie does *not* match any of our tokens, so it shouldn't be sent back.
                return false
            }

            // If we're still here then the movie should be included.
            return true
        }
    }

    var body: some View {
        NavigationStack {
            List(searchResults) { movie in
                Text(movie.name)
            }
            .navigationTitle("Movies+")
            .searchable(text: $searchText, tokens: $currentTokens, suggestedTokens: .constant(suggestedTokens), prompt: Text("Type to filter, or use # for tags")) { token in
                Text(token.name)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
