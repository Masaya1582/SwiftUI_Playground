//
//  AnimalList.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/31.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct AnimalList: View {
    var body: some View {
        List(Animal.allAnimals, id: \.name) { animal in
            AnimalRow(animal: animal)
        }
    }
}

struct AnimalRow: View {
    let animal: Animal

    var body: some View {
        HStack {
            Image(animal.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(animal.name)
                    .font(.headline)
                Text(animal.description)
                    .font(.subheadline)
            }
        }
    }
}
