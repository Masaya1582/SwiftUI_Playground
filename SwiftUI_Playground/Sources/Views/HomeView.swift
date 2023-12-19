//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct FoodMenuItem: Identifiable {
    let id: Int
    let name: String
    let image: String
    let price: Double
}

struct HomeView: View {
    private let menuItems: [FoodMenuItem] = [
        FoodMenuItem(id: 1, name: "Pizza", image: "https://source.unsplash.com/featured/?pizza", price: 9.99),
        FoodMenuItem(id: 2, name: "Burger", image: "https://source.unsplash.com/featured/?burger", price: 7.99),
        FoodMenuItem(id: 3, name: "Sushi", image: "https://source.unsplash.com/featured/?sushi", price: 12.99)
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(menuItems) { item in
                    VStack {
                        AsyncImage(url: URL(string: item.image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipped()
                        } placeholder: {
                            Color.gray
                                .frame(width: 150, height: 150)
                        }
                        Text(item.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Text("$\(item.price, specifier: "%.2f")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(width: 150, height: 200)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
            .padding()
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
