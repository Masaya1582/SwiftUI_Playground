//
//  AddCocktailView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/31.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct AddCocktailView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var viewModel: CocktailViewModel
    @State private var name = ""
    @State private var description = ""
    @State private var imageName = "default" // Set your default image name here

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                TextField("Image Name", text: $imageName)
            }
            .navigationBarTitle("Add Cocktail")
            .navigationBarItems(trailing: Button("Save") {
                viewModel.addCocktail(name: name, description: description, imageName: imageName)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct CocktailDetail: View {
    var cocktail: Cocktail

    var body: some View {
        VStack {
            Image(cocktail.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 200)
            Text(cocktail.name)
                .font(.title)
            Text(cocktail.description)
                .padding()
            Spacer()
        }
        .navigationTitle(cocktail.name)
    }
}
