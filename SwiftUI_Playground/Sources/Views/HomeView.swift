//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum Food: String, CaseIterable {
    case burger = "Burger"
    case nuggets = "Nuggets"
    case pancakes = "Pancakes"
    case pizza = "Pizza"
    case spaghetti = "Spaghetti"
}

struct HomeView: View {
    @State private var selectedFood = Food.burger

    var body: some View {
        VStack {
            Text("Food Picker")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
                .padding()

            Text("Selected Food: \(selectedFood.rawValue)")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
                .padding()

            Picker("Select Food", selection: $selectedFood) {
                ForEach(Food.allCases, id: \.self) { condition in
                    Text(condition.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Image(selectedFood.rawValue)
                .modifier(CustomImage(width: 200, height: 200))

            Spacer()
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
