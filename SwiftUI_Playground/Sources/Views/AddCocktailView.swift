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
    @State private var selectedImage: UIImage?
    @State private var isShowImagePicker = false

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                Button("Choose Image") {
                    isShowImagePicker = true
                }
                .sheet(isPresented: $isShowImagePicker) {
                    ImagePicker(selectedImage: $selectedImage)
                }
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
            }
            .navigationBarTitle("Add Cocktail")
            .navigationBarItems(trailing: Button("Save") {
                if let image = selectedImage {
                    if !name.isEmpty && !description.isEmpty {
                        viewModel.addCocktail(name: name, description: description, selectedImage: selectedImage)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            })
        }
    }
}

struct CocktailDetail: View {
    var cocktail: Cocktail

    var body: some View {
        VStack {
            if let uiImage = UIImage(data: cocktail.imageName!), let image = Image(uiImage: uiImage) {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
            } else {
                // Placeholder image in case the conversion fails or image is nil
                Image("default_image_name")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
            }
            Text(cocktail.name)
                .font(.title)
            Text(cocktail.description)
                .padding()
            Spacer()
        }
        .navigationTitle(cocktail.name)
    }
}
