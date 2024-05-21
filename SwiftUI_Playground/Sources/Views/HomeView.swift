//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    private let foodItems = [
        FoodItem(name: "Pizza", imageName: "pizza", description: "Delicious cheese pizza with a crispy crust."),
        FoodItem(name: "Burger", imageName: "burger", description: "Juicy beef burger with lettuce and tomato."),
        FoodItem(name: "Pasta", imageName: "pasta", description: "Creamy Alfredo pasta with chicken."),
        FoodItem(name: "Ice Cream", imageName: "ice_cream", description: "Vanilla ice cream with rainbow sprinkles."),
        FoodItem(name: "Fruit Salad", imageName: "fruit_salad", description: "Fresh fruit salad with a mix of berries.")
    ]

    var body: some View {
        NavigationView {
            List(foodItems) { item in
                FoodItemView(foodItem: item)
            }
            .navigationBarTitle("Child-Friendly Menu")
        }
    }

}

struct FoodItemView: View {
    var foodItem: FoodItem

    var body: some View {
        HStack {
            Image(foodItem.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(foodItem.name)
                    .font(.headline)
                Text(foodItem.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
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
