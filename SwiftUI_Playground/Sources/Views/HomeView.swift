//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var items: [Item] = [
        Item(title: "Item 1", description: "This is the description of Item 1."),
        Item(title: "Item 2", description: "This is the description of Item 2."),
        Item(title: "Item 3", description: "This is the description of Item 3."),
        Item(title: "Item 4", description: "This is the description of Item 4."),
        Item(title: "Item 5", description: "This is the description of Item 5."),
        Item(title: "Item 6", description: "This is the description of Item 6."),
        Item(title: "Item 7", description: "This is the description of Item 7."),
        Item(title: "Item 8", description: "This is the description of Item 8."),
        Item(title: "Item 9", description: "This is the description of Item 9."),
        Item(title: "Item 10", description: "This is the description of Item 10."),
        Item(title: "Item 11", description: "This is the description of Item 11."),
        Item(title: "Item 12", description: "This is the description of Item 12.")
    ]

    var body: some View {
        List {
            ForEach(items) { item in
                ItemRow(item: item)
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
