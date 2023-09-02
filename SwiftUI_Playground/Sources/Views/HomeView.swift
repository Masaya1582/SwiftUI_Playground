//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    typealias ShoppingListItem = (name: String, quantity: Int)

    private let shoppingList: [ShoppingListItem] = [
        ("Apples", 5),
        ("Bananas", 3),
        ("Milk", 2),
        ("Bread", 1)
    ]

    var body: some View {
        NavigationView {
            List(shoppingList, id: \.name) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text("\(item.quantity)")
                }
            }
            .navigationBarTitle("Shopping List")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
