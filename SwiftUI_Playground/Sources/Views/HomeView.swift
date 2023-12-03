//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image("img_dio") // Replace with your profile picture
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                )
                .shadow(radius: 5)
                .padding(.top, 40)

            Text("Michael J Fox") // Replace with the user's name
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("iOS Developer") // Replace with user's occupation or description
                .font(.headline)
                .foregroundColor(.gray)

            Divider()
                .padding(.vertical, 20)

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    ProfileItemView(title: "Email", value: "john@example.com") // Replace with user's email
                    ProfileItemView(title: "Location", value: "New York City") // Replace with user's location
                    ProfileItemView(title: "Website", value: "www.johndoe.com") // Replace with user's website
                }
                Spacer()
            }
            .padding(.horizontal, 20)

            Spacer()
        }
        .navigationBarTitle("Profile")
    }
}

struct ProfileItemView: View {
    var title: String
    var value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
                .foregroundColor(.gray)
            Text(value)
                .font(.body)
                .foregroundColor(.black)
        }
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
