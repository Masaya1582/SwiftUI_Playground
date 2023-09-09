//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = CocktailViewModel()
    @State private var showingAddSheet = false

    var body: some View {
        NavigationView {
            List(viewModel.cocktails) { cocktail in
                NavigationLink(destination: CocktailDetail(cocktail: cocktail)) {
                    HStack {
                        if let uiImage = UIImage(data: cocktail.imageName!), let image = Image(uiImage: uiImage) {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                        } else {
                            // Placeholder image in case the conversion fails or image is nil
                            Image("default_image_name")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 200)
                        }
                        Text(cocktail.name)
                    }
                }
            }
            .navigationBarTitle("Cocktail List")
            .navigationBarItems(trailing: Button(action: {
                showingAddSheet = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showingAddSheet) {
            AddCocktailView(viewModel: viewModel)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
