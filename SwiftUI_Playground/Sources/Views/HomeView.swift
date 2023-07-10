//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List(0..<10) { i in
                Text("Row \(i.description)")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 20))
                    .listRowSeparatorTint(.red)
                    // .listRowSeparatorTint(.pink, edges: .top)

            }
            .navigationTitle("List")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
