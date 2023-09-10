//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let friends: [Friend] = [
        Friend(name: "John Doe", imageName: "person.circle"),
        Friend(name: "Jane Smith", imageName: "person.circle.fill"),
        Friend(name: "Tom Johnson", imageName: "person.circle"),
        Friend(name: "John Doe", imageName: "person.circle"),
        Friend(name: "Jane Smith", imageName: "person.circle.fill"),
        Friend(name: "Tom Johnson", imageName: "person.circle"),
        Friend(name: "John Doe", imageName: "person.circle"),
        Friend(name: "Jane Smith", imageName: "person.circle.fill"),
        Friend(name: "Tom Johnson", imageName: "person.circle"),
        Friend(name: "John Doe", imageName: "person.circle"),
        Friend(name: "Jane Smith", imageName: "person.circle.fill"),
        Friend(name: "Tom Johnson", imageName: "person.circle")
    ]

    var body: some View {
        NavigationView {
            List(friends) { friend in
                NavigationLink(destination: Text("Profile of \(friend.name)")) {
                    HStack {
                        Image(systemName: friend.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 10)

                        Text(friend.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Friend List")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
