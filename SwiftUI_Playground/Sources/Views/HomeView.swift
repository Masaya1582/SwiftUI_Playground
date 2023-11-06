//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text("Item: \(item)")
                        .modifier(CustomLabel(foregroundColor: .black, size: 20))
                }
            }
            // .listStyle(PlainListStyle())
            // .listStyle(GroupedListStyle())
            // .listStyle(InsetGroupedListStyle())
            // .listStyle(SidebarListStyle())
            // .listStyle(InsetListStyle())
            // .listStyle(DefaultListStyle())
            .navigationTitle("List Styles")
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
