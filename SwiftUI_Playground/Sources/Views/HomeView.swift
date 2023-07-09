//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = NumberViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Sum: \(viewModel.sum)")
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))

            TextField("Enter first number", text: $viewModel.firstNumber)
                .padding()
                .keyboardType(.numberPad)

            TextField("Enter second number", text: $viewModel.secondNumber)
                .padding()
                .keyboardType(.numberPad)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
