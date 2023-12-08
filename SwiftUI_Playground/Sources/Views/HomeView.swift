//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties

    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                // 1. Main feed list
                List {
                    ForEach(0..<10) { _ in
                        TweetCardView()
                    }
                }
                .listStyle(PlainListStyle())
                BottomNavigationBar()
            }
            .navigationTitle("Home")
            .navigationBarItems(leading: TwitterLogoView())
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Twitter Logo View
struct TwitterLogoView: View {
    var body: some View {
        Image(systemName: "bird")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .foregroundColor(.white)
    }
}

// MARK: - Tweet Card View
struct TweetCardView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            UnsplashProfileImage()
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Username")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("@handle")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Text("Here's some tweet content that the user has posted. It might be a bit longer and span multiple lines.")
                    .foregroundColor(.white)

                Text("3h ago")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }

    // MARK: - Unsplash Profile Image View
    struct UnsplashProfileImage: View {
        var body: some View {
            AsyncImage(url: URL(string: "https://source.unsplash.com/random/300x300/?portrait")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
        }
    }
}

// MARK: - Bottom Navigation Bar View
struct BottomNavigationBar: View {
    var body: some View {
        HStack {
            Spacer()

            // 1. Home icon
            Image(systemName: "house")
                .foregroundColor(.white) // Monochromatic color for dark mode

            Spacer()

            // 2. Search icon
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white) // Monochromatic color for dark mode

            Spacer()

            // 3. Notifications icon
            Image(systemName: "bell")
                .foregroundColor(.white) // Monochromatic color for dark mode

            Spacer()

            // 4. Messages icon
            Image(systemName: "envelope")
                .foregroundColor(.white) // Monochromatic color for dark mode

            Spacer()
        }
        .padding()
        .background(Color(UIColor.systemBackground)) // Adapts to dark mode
        .shadow(radius: 1)
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
