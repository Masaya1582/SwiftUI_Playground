//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private  let menuItems: [FoodItem] = [
        FoodItem(name: "Chicken Nuggets", description: "Crispy chicken nuggets with ketchup", price: 5.99, imageName: "nuggets"),
        FoodItem(name: "Cheeseburger", description: "Juicy cheeseburger with fries", price: 6.99, imageName: "burger"),
        FoodItem(name: "Spaghetti", description: "Delicious spaghetti with tomato sauce", price: 7.99, imageName: "spaghetti"),
        FoodItem(name: "Pancakes", description: "Fluffy pancakes with syrup and butter", price: 4.99, imageName: "pancakes"),
        FoodItem(name: "Pizza", description: "Cheesy pizza with your favorite toppings", price: 8.99, imageName: "pizza")
    ]

    var body: some View {
        NavigationView {
            List(menuItems) { item in
                NavigationLink(destination: FoodDetail(item: item)) {
                    FoodRow(item: item)
                }
            }
            .navigationTitle("Simple Food Menu")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
