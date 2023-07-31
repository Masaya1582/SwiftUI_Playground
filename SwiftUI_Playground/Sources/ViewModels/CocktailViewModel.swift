// 
//  CocktailViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class CocktailViewModel: ObservableObject {
    @Published var cocktails: [Cocktail] = []

    init() {
        loadCocktails()
    }

    // Load cocktails from UserDefaults
    func loadCocktails() {
        if let data = UserDefaults.standard.data(forKey: "cocktails"),
           let savedCocktails = try? JSONDecoder().decode([Cocktail].self, from: data) {
            cocktails = savedCocktails
        }
    }

    // Save cocktails to UserDefaults
    func saveCocktails() {
        if let data = try? JSONEncoder().encode(cocktails) {
            UserDefaults.standard.set(data, forKey: "cocktails")
        }
    }

    // Add a new cocktail
    func addCocktail(name: String, description: String, imageName: String) {
        let newCocktail = Cocktail(name: name, description: description, imageName: imageName)
        cocktails.append(newCocktail)
        saveCocktails()
    }
}
