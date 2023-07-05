//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var store = MovieStore()
    var body: some View {
        NavigationView {
            List(store.movies) { movie in
                HStack {
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        Text("Year: \(String(movie.year))")
                            .font(.subheadline)
                    }
                    Spacer()
                    movie.posterURL.map {
                        AsyncImage(url: $0) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)
                            case .failure:
                                Image(systemName: "xmark.square.fill")
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(width: 50, height: 50)
                    }
                }
            }
            .navigationBarTitle("Movies")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
