//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let fruits = ["Apple", "Banana", "Orange", "Grapes", "Watermelon", "Mango"]

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(fruits.enumerated()), id: \.element) { index, fruit in
                    Text("\(index + 1). \(fruit)")
                }
            }
            .navigationBarTitle("Fruits List")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
