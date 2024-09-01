//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    var recipe: Recipe // Assume this is a model containing your recipe data

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // Recipe Image
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                    .cornerRadius(10)
                    .shadow(radius: 5)

                // Recipe Title
                Text(recipe.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // Recipe Description
                Text(recipe.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 16)

                // Ingredients
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.semibold)

                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        HStack(alignment: .top) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                                .foregroundColor(.blue)
                            Text(ingredient)
                                .font(.body)
                        }
                    }
                }
                .padding(.vertical, 10)

                // Instructions
                VStack(alignment: .leading, spacing: 8) {
                    Text("Instructions")
                        .font(.title2)
                        .fontWeight(.semibold)

                    ForEach(recipe.instructions.indices, id: \.self) { index in
                        HStack(alignment: .top) {
                            Text("\(index + 1).")
                                .font(.body)
                                .fontWeight(.bold)
                            Text(recipe.instructions[index])
                                .font(.body)
                        }
                    }
                }
                .padding(.vertical, 10)

                // Notes
                if !recipe.notes.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Notes")
                            .font(.title2)
                            .fontWeight(.semibold)

                        Text(recipe.notes)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 10)
                }
            }
            .padding()
        }
        .navigationTitle("Recipe Memo")
    }
}

// Sample Recipe Model
struct Recipe {
    var imageName: String
    var title: String
    var description: String
    var ingredients: [String]
    var instructions: [String]
    var notes: String
}

// Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleRecipe = Recipe(
            imageName: "img_pancakes",
            title: "Delicious Pancakes",
            description: "Fluffy and light pancakes perfect for breakfast.",
            ingredients: [
                "2 cups flour",
                "2 tablespoons sugar",
                "1 tablespoon baking powder",
                "1/2 teaspoon salt",
                "2 eggs",
                "1 1/2 cups milk",
                "1/4 cup melted butter"
            ],
            instructions: [
                "In a large bowl, mix together the flour, sugar, baking powder, and salt.",
                "In another bowl, beat the eggs and then whisk in the milk and melted butter.",
                "Pour the wet ingredients into the dry ingredients and stir until just combined.",
                "Heat a lightly oiled griddle or frying pan over medium high heat.",
                "Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake.",
                "Brown on both sides and serve hot."
            ],
            notes: "Add a splash of vanilla extract for extra flavor."
        )

        HomeView(recipe: sampleRecipe)
    }
}
