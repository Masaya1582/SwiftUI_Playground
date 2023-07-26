//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let items: [Item] = [
        Item(imageName: "img_barack", title: "Obama"),
        Item(imageName: "img_biden", title: "Biden"),
        Item(imageName: "img_bill", title: "Clinton"),
        Item(imageName: "img_donald", title: "Trump"),
        Item(imageName: "img_george_hw", title: "George.HW"),
        Item(imageName: "img_george_w", title: "George.W"),
        Item(imageName: "img_gerald", title: "Ford"),
        Item(imageName: "img_jimmy", title: "Carter"),
        Item(imageName: "img_ronald", title: "Reagan"),
        Item(imageName: "img_washington", title: "Washington"),
        Item(imageName: "img_thomas", title: "Jefferson"),
        Item(imageName: "img_abraham", title: "Lincoln")
    ]
    private let gridItems = [GridItem(.adaptive(minimum: 180))]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems, spacing: 16) {
                ForEach(items) { item in
                    FancyGridItem(item: item)
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
