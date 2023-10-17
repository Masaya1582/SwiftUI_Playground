//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let items = ["Apple", "Banana", "Strawberry", "Mango", "PineApple", "Orange", "Grapes", "Watermelon", "Cherry", "Kiwi"]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(items, id: \.self) { item in
                    FancyListItemView(item: item)
                }
            }
            .padding()
        }
    }
}

struct FancyListItemView: View {
    let item: String

    var body: some View {
        HStack {
            Text(item)
                .font(.headline)
                .foregroundColor(Color.black)
            Spacer()
            Image(systemName: "arrow.right.circle")
                .foregroundColor(Color.blue)
                .font(.system(size: 24))
        }
        .padding()
        .frame(width: 320, height: 60)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
        )
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
