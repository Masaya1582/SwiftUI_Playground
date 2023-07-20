//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @ObservedObject var followerViewModel = FollowerViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                List(followerViewModel.followers.filter { searchText.isEmpty ? true : $0.login.contains(searchText) }) { follower in
                    NavigationLink(destination: FollowerDetailView(avatarURL: follower.avatarURL, userName: follower.login)) {
                        FollowerRow(follower: follower)
                    }
                }
            }
            .onAppear {
                Task {
                    await followerViewModel.fetchFollowers()
                }
            }
            .navigationBarTitle("Followers")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
