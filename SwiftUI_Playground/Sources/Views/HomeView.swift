//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var itemName = ""
    @State private var items: [String] = []

    var body: some View {
        VStack {
            TextField("Enter item name", text: $itemName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Add Item") {
                addItem()
            }
            .padding()

            List(items, id: \.self) { item in
                HStack {
                    Text(item)
                    Spacer()
                    Button("Delete") {
                        deleteItem(name: item)
                    }
                }
            }
        }
        .onAppear {
            fetchItems()
        }
    }

    private func fetchItems() {
        items = DatabaseManager.shared.getAllItems()
    }

    private func addItem() {
        DatabaseManager.shared.addItem(name: itemName)
        itemName = ""
        fetchItems()
    }

    private func deleteItem(name: String) {
        DatabaseManager.shared.deleteItem(name: name)
        fetchItems()
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
