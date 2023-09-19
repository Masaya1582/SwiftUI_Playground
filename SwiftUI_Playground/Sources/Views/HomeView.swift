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
        VStack {
            Text("Account #")
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))

            Text(viewModel.accountNumber)
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
                .privacySensitive()
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
