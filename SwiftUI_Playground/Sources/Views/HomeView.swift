//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let recipes: [Recipe] = [
        Recipe(
            title: "Chocolate Cake",
            imageName: "chocolate_cake",
            ingredients: ["2 cups flour", "1 cup sugar", "1/2 cup cocoa powder", "2 eggs", "1 cup milk"],
            instructions: ["Preheat oven to 350°F.", "Mix dry ingredients.", "Add wet ingredients.", "Bake for 30 minutes."]
        ),
        Recipe(
            title: "Chocolate Cake",
            imageName: "chocolate_cake",
            ingredients: ["2 cups flour", "1 cup sugar", "1/2 cup cocoa powder", "2 eggs", "1 cup milk"],
            instructions: ["Preheat oven to 350°F.", "Mix dry ingredients.", "Add wet ingredients.", "Bake for 30 minutes."]
        ),
        Recipe(
            title: "Chocolate Cake",
            imageName: "chocolate_cake",
            ingredients: ["2 cups flour", "1 cup sugar", "1/2 cup cocoa powder", "2 eggs", "1 cup milk"],
            instructions: ["Preheat oven to 350°F.", "Mix dry ingredients.", "Add wet ingredients.", "Bake for 30 minutes."]
        ),
        Recipe(
            title: "Chocolate Cake",
            imageName: "chocolate_cake",
            ingredients: ["2 cups flour", "1 cup sugar", "1/2 cup cocoa powder", "2 eggs", "1 cup milk"],
            instructions: ["Preheat oven to 350°F.", "Mix dry ingredients.", "Add wet ingredients.", "Bake for 30 minutes."]
        ),
        Recipe(
            title: "Chocolate Cake",
            imageName: "chocolate_cake",
            ingredients: ["2 cups flour", "1 cup sugar", "1/2 cup cocoa powder", "2 eggs", "1 cup milk"],
            instructions: ["Preheat oven to 350°F.", "Mix dry ingredients.", "Add wet ingredients.", "Bake for 30 minutes."]
        )
    ]

    var body: some View {
        NavigationView {
            List(recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    RecipeCardView(recipe: recipe)
                }
            }
            .navigationBarTitle("Recipe Book")
        }
    }
}

struct RecipeCardView: View {
    let recipe: Recipe

    var body: some View {
        VStack(alignment: .leading) {
            Image(recipe.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()

            Text(recipe.title)
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
                .padding(.vertical, 10)

            Text("Ingredients:")
                .modifier(CustomLabel(foregroundColor: .black, size: 20))

            ForEach(recipe.ingredients, id: \.self) { ingredient in
                Text(ingredient)
                    .modifier(CustomLabel(foregroundColor: .black, size: 14))
                    .padding(.leading, 10)
            }

            Text("Instructions:")
                .modifier(CustomLabel(foregroundColor: .black, size: 20))

            ForEach(recipe.instructions, id: \.self) { instruction in
                Text(instruction)
                    .modifier(CustomLabel(foregroundColor: .black, size: 14))
                    .padding(.leading, 10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack {
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()

                Text(recipe.title)
                    .modifier(CustomLabel(foregroundColor: .black, size: 20))
                    .padding(.vertical, 10)

                Text("Ingredients:")
                    .modifier(CustomLabel(foregroundColor: .black, size: 20))

                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .modifier(CustomLabel(foregroundColor: .black, size: 14))
                        .padding(.leading, 10)
                }

                Text("Instructions:")
                    .modifier(CustomLabel(foregroundColor: .black, size: 20))

                ForEach(recipe.instructions, id: \.self) { instruction in
                    Text(instruction)
                        .modifier(CustomLabel(foregroundColor: .black, size: 14))
                        .padding(.leading, 10)
                }
            }
            .padding()
        }
        .navigationBarTitle(recipe.title)
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
