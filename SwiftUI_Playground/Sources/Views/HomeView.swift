//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var favoriteCoffees: [CoffeeMemo] = [
        CoffeeMemo(name: "Espresso", notes: "Strong and rich"),
        CoffeeMemo(name: "Latte", notes: "Creamy with a light coffee flavor"),
        CoffeeMemo(name: "Cappuccino", notes: "Perfect balance of espresso, steam milk, and foam")
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(favoriteCoffees) { coffee in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(coffee.name)
                                .font(.headline)
                                .fontWeight(.bold)
                            Text(coffee.notes)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Image(systemName: "cup.and.saucer.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.brown)
                    }
                    .padding(.vertical)
                }
                .onDelete(perform: deleteCoffee)
            }
            .navigationTitle("Favorite Coffees")
            .toolbar {
                EditButton()
            }
        }
    }

    private func deleteCoffee(at offsets: IndexSet) {
        favoriteCoffees.remove(atOffsets: offsets)
    }
}

struct CoffeeMemo: Identifiable {
    let id = UUID()
    let name: String
    let notes: String
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
