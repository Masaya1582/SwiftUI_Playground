//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        ScrollViewReader { value in
            ScrollView {
                Button("Jump to #8") {
                    withAnimation(.spring()) {
                        value.scrollTo(8)
                        // value.scrollTo(8, anchor: .top)
                    }
                }
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
                .padding()

                ForEach(0..<100) { i in
                    Text("Example \(i)")
                        .font(.title)
                        .frame(width: 200, height: 200)
                        .background(viewModel.colors[i % viewModel.colors.count])
                        .id(i)
                }
            }
        }
        .frame(height: 350)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
