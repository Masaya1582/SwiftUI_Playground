//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var categories = [
        Category(name: "Technology", color: .blue),
        Category(name: "Science", color: .green),
        Category(name: "Art", color: .purple),
        Category(name: "Music", color: .orange),
        Category(name: "Sports", color: .red)
    ]

    @State private var selectedCategory: Category? = nil

    var body: some View {
        VStack {
            Text("Select your Favorite Category")
                .font(.largeTitle)
                .padding()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(categories) { category in
                        CategoryView(category: category, isSelected: selectedCategory?.id == category.id)
                            .onTapGesture {
                                withAnimation {
                                    selectedCategory = category
                                }
                            }
                    }
                }
                .padding()
            }

            Spacer()

            if let selectedCategory = selectedCategory {
                Text("You selected \(selectedCategory.name)")
                    .font(.title)
                    .padding()
                    .transition(.opacity)
                    .animation(.easeInOut, value: selectedCategory)
            }
        }
        .padding()
    }
}

struct CategoryView: View {
    var category: Category
    var isSelected: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(category.color)
                .frame(width: 100, height: 100)
                .shadow(radius: isSelected ? 10 : 2)
                .scaleEffect(isSelected ? 1.1 : 1.0)

            Text(category.name)
                .foregroundColor(.white)
                .font(.headline)
        }
        .animation(.spring(), value: isSelected)
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
