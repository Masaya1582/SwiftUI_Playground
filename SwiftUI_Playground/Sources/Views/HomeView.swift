//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let fruits = ["りんご", "オレンジ", "バナナ"]
    var body: some View {
        List {
            ForEach(0 ..< fruits.count) { index in
                Text(fruits[index])
            }
        }
        .scrollContentBackground(.hidden)
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
