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
                        Image(cocktail.imageName)
                            .resizable()
                            .frame(width: 60, height: 60)
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
