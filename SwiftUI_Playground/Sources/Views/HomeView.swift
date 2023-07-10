//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = TextFieldViewModel()

    var body: some View {
        VStack {
            Text(viewModel.enteredText)
                .font(.title)
                .padding()

            TextField("Enter text", text: $viewModel.enteredText)
                .padding()
        }
        .onAppear {
            viewModel.setupDebounce()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
