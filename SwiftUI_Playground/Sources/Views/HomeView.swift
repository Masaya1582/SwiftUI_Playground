//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let items: [VintageItem] = [
        VintageItem(imageName: "img_donald", title: "Trump"),
        VintageItem(imageName: "img_donald", title: "Trump"),
        VintageItem(imageName: "img_donald", title: "Trump"),
        VintageItem(imageName: "img_donald", title: "Trump"),
        VintageItem(imageName: "img_donald", title: "Trump"),
        VintageItem(imageName: "img_donald", title: "Trump")
    ]

    private let columns = [
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items) { item in
                    VintageItemView(item: item)
                }
            }
            .padding()
        }
    }
}

struct VintageItemView: View {
    let item: VintageItem

    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
            Text(item.title)
                .font(.headline)
                .padding(.top, 8)
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
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
