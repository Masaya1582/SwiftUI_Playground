//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject var viewModel = CurrencyConverterViewModel()

    var body: some View {
        VStack {
            Text("USD to Euro Converter")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))

            TextField("Enter USD amount", text: $viewModel.usdAmount)
                .modifier(CustomTextField())

            Text("Equivalent in Euros: \(viewModel.euroAmount) €")
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
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
