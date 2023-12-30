//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VintageMenuView()
    }
}

struct VintageMenuView: View {
    private let menuItems = [
        MenuItem(name: "Grilled Cheese", price: "$5.99"),
        MenuItem(name: "Tomato Soup", price: "$3.99"),
        MenuItem(name: "Caesar Salad", price: "$7.99"),
        MenuItem(name: "Beef Burger", price: "$9.99"),
        MenuItem(name: "Apple Pie", price: "$4.99")
    ]

    var body: some View {
        NavigationView {
            ZStack {
                Color.brown.opacity(0.3).ignoresSafeArea()
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(menuItems) { item in
                        HStack {
                            Text(item.name)
                                .font(.headline)
                                .foregroundColor(.white)

                            Spacer()

                            Text(item.price)
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.brown.opacity(0.7))
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Vintage Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let price: String
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
