//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("Check Console for output")
            .modifier(CustomLabel(foregroundColor: .black, size: 24))
            .onAppear {
                var trainer1: Pokemon?
                var trainer2: Pokemon?

                trainer1 = Pokemon(name: "Pikachu") // Pikachu's reference count = 1
                trainer2 = trainer1 // Pikachu's reference count = 2

                trainer1 = nil // Pikachu's reference count = 1
                trainer2 = nil // Pikachu's reference count = 0, Pikachu is deallocated
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
