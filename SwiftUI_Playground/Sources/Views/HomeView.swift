//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let items = ["Item 1", "Item 2", "Item 3", "Item 4"]

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    NavigationLink(destination: Text(item)) { // Replace Text(item) with your detail view
                        FancyListRow(item: item)
                            .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(PlainListStyle()) // Customize the list style
            .navigationBarTitle("Fancy List")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
