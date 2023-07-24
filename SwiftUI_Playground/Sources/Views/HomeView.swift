//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        VStack {
            List(viewModel.squaredNumbers, id: \.self) { squaredNumber in
                Text("\(squaredNumber)")
            }
            Button("Square Numbers") {
                viewModel.squareNumbers()
            }
            .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .orange))
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
