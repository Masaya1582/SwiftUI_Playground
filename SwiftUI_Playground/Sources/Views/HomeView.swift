//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = TextFieldViewModel()
    @State private var number = ""

    var body: some View {
        ZStack {
            Color.orange.opacity(0.3)
                .ignoresSafeArea()
            VStack(spacing: 24) {
                Text("Number: \(viewModel.number)")
                    .font(.system(size: 20, weight: .bold))
                TextField("Your Number", text: $viewModel.number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
