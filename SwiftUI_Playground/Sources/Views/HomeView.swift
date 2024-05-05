//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct GridItemModel {
    var id: Int
    var name: String
    var color: Color
}


struct HomeView: View {
    private let items = [
        GridItemModel(id: 1, name: "Item 1", color: .red),
        GridItemModel(id: 2, name: "Item 2", color: .blue),
        GridItemModel(id: 3, name: "Item 3", color: .green),
        GridItemModel(id: 4, name: "Item 4", color: .orange),
        GridItemModel(id: 5, name: "Item 1", color: .red),
        GridItemModel(id: 6, name: "Item 2", color: .blue),
        GridItemModel(id: 7, name: "Item 3", color: .green),
        GridItemModel(id: 8, name: "Item 4", color: .orange),
        GridItemModel(id: 9, name: "Item 1", color: .red),
        GridItemModel(id: 10, name: "Item 2", color: .blue),
        GridItemModel(id: 11, name: "Item 3", color: .green),
        GridItemModel(id: 12, name: "Item 4", color: .orange)
    ]

    private var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.id) { item in
                    Text(item.name)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(item.color)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
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
