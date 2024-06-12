//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct ChatUser {
    var name: String
    var imageName: String
}

// Define a row view for displaying each chat user
struct UserRow: View {
    var user: ChatUser

    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            Text(user.name)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 4)
    }
}

struct HomeView: View {
    private let users: [ChatUser] = [
        ChatUser(name: "Alice", imageName: "img_donald"),
        ChatUser(name: "Bob", imageName: "img_donald"),
        ChatUser(name: "Charlie", imageName: "img_donald"),
        ChatUser(name: "Alice", imageName: "img_donald"),
        ChatUser(name: "Bob", imageName: "img_donald"),
        ChatUser(name: "Charlie", imageName: "img_donald"),
        ChatUser(name: "Alice", imageName: "img_donald"),
        ChatUser(name: "Bob", imageName: "img_donald"),
        ChatUser(name: "Charlie", imageName: "img_donald"),
        ChatUser(name: "Alice", imageName: "img_donald"),
        ChatUser(name: "Bob", imageName: "img_donald"),
        ChatUser(name: "Charlie", imageName: "img_donald")
    ]

    var body: some View {
        NavigationView {
            List(users, id: \.name) { user in
                UserRow(user: user)
            }
            .navigationTitle("Chat Room")
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
