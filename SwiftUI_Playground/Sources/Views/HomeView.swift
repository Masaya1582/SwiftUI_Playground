//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(menuItems) { item in
                    NavigationLink(destination: MenuItemDetailView(item: item)) {
                        MenuItemRow(item: item)
                    }
                }
            }
            .navigationTitle("Ramen Menu")
        }
    }

    var menuItems: [MenuItem] {
        [
            MenuItem(name: "Shoyu Ramen", description: "Soy sauce flavored ramen with chicken broth.", price: "$12.99", imageUrl: "https://source.unsplash.com/featured/?ramen"),
            MenuItem(name: "Miso Ramen", description: "Miso flavored ramen with pork broth.", price: "$13.99", imageUrl: "https://source.unsplash.com/featured/?ramen"),
            MenuItem(name: "Tonkotsu Ramen", description: "Rich pork bone broth ramen.", price: "$14.99", imageUrl: "https://source.unsplash.com/featured/?ramen"),
            MenuItem(name: "Shio Ramen", description: "Salt flavored ramen with clear broth.", price: "$11.99", imageUrl: "https://source.unsplash.com/featured/?ramen")
        ]
    }
}

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var price: String
    var imageUrl: String
}

struct MenuItemRow: View {
    var item: MenuItem

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(item.price)
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 8)
    }
}

struct MenuItemDetailView: View {
    var item: MenuItem

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: item.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(8)

            Text(item.name)
                .font(.largeTitle)
                .padding(.top, 16)

            Text(item.description)
                .font(.body)
                .padding(.top, 8)

            Text(item.price)
                .font(.title)
                .padding(.top, 8)

            Spacer()
        }
        .padding()
        .navigationTitle(item.name)
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
