//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)

            FloatingTabBar()
        }
    }
}

struct FloatingTabBar: View {
    @State private var selectedIndex = 0
    private let items: [BottomBarItem] = [
        BottomBarItem(icon: "house.fill", title: "Home", color: .purple),
        BottomBarItem(icon: "heart", title: "Likes", color: .pink),
        BottomBarItem(icon: "magnifyingglass", title: "Search", color: .orange),
        BottomBarItem(icon: "person.fill", title: "Profile", color: .blue)
    ]

    var body: some View {
        HStack {
            ForEach(0..<items.count) { index in
                Button(action: {
                    selectedIndex = index
                }) {
                    HStack {
                        Image(systemName: items[index].icon)
                            .foregroundColor(index == selectedIndex ? items[index].color : .gray)
                        if index == selectedIndex {
                            Text(items[index].title)
                                .foregroundColor(items[index].color)
                                .transition(.slide)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -5)
        .padding(.horizontal)
    }
}

struct BottomBarItem {
    let icon: String
    let title: String
    let color: Color
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
