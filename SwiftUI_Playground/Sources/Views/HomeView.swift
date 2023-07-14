//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let columns: Int = 3
    private let pokemons = [
        Pokemon(name: "Joe", imageName: "img_biden"),
        Pokemon(name: "Donald", imageName: "img_donald"),
        Pokemon(name: "Barack", imageName: "img_barack"),
        Pokemon(name: "George W", imageName: "img_george_w"),
        Pokemon(name: "Bill", imageName: "img_bill"),
        Pokemon(name: "George H.W", imageName: "img_george_hw"),
        Pokemon(name: "Ronald", imageName: "img_ronald"),
        Pokemon(name: "Jimmy", imageName: "img_jimmy"),
        Pokemon(name: "Gerald", imageName: "img_gerald")
    ]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                ForEach(0..<self.pokemons.count / self.columns) { rowIndex in
                    HStack {
                        ForEach(0..<self.columns) { columnIndex in
                            self.getPokemonCell(
                                pokemon: self.getPokemon(rowIndex: rowIndex, columnIndex: columnIndex),
                                width: self.cellWidth(width: geometry.size.width),
                                height: self.cellHeight(width: geometry.size.width))
                        }
                    }
                }

                if (self.pokemons.count % self.columns > 0) {
                    HStack {
                        ForEach(0..<self.pokemons.count % self.columns) { lastColumnIndex in
                            self.getPokemonCell(
                                pokemon: self.getPokemon(lastColumnIndex: lastColumnIndex),
                                width: self.cellWidth(width: geometry.size.width),
                                height: self.cellHeight(width: geometry.size.width))
                        }
                        Spacer()
                    }
                }
            }
        }
    }

    private func getPokemon(rowIndex: Int, columnIndex: Int) -> Pokemon {
        return pokemons[columns * rowIndex + columnIndex]
    }

    private func getPokemon(lastColumnIndex: Int) -> Pokemon {
        return self.pokemons[self.columns * (self.pokemons.count / self.columns) + lastColumnIndex]
    }

    private func cellWidth(width: CGFloat) -> CGFloat {
        return width / CGFloat(columns)
    }

    private func cellHeight(width: CGFloat) -> CGFloat {
        return cellWidth(width: width) * 1.5
    }

    private func getPokemonCell(pokemon: Pokemon, width: CGFloat, height: CGFloat) -> AnyView {
        return AnyView(PokemonCell(pokemon: pokemon)
            .frame(width: width,
                   height: height)
                .border(Color.black, width: 2)
                .clipped())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
