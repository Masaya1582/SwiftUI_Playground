//
//  AddPokemonView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/04.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct AddPokemonView: View {
    @EnvironmentObject var pokemonStore: PokemonStore
    @State private var name = ""
    @State private var type = ""
    @State private var level = 1
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Enter Pokemon name", text: $name)
            }
            Section(header: Text("Type")) {
                TextField("Enter Pokemon type", text: $type)
            }
            Section(header: Text("Level")) {
                Stepper(value: $level, in: 1...100) {
                    Text("\(level)")
                }
            }
            Button(action: addPokemon) {
                Text("Add Pokemon")
            }
        }
        .navigationBarTitle("Add Pokemon")
    }

    // ポケモン情報を追加する
    private func addPokemon() {
        if name.isEmpty || type.isEmpty {
            return
        }
        let pokemon = Pokemon(id: pokemonStore.pokemons.count + 1, name: name, type: type, level: level)
        pokemonStore.pokemons.append(pokemon)
        name = ""
        type = ""
        level = 1
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPokemonView()
    }
}
