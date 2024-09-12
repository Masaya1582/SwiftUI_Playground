//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var firebaseService = FirebaseService()

    var body: some View {
        NavigationView {
            List(firebaseService.posts) { post in
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: post.imageUrl)) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    Text(post.userName)
                        .font(.headline)
                    if let message = post.message {
                        Text(message)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 3)
            }
            .navigationTitle("Posts")
        }
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
