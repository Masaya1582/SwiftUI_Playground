//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel = CalculatorViewModel()

    private let buttons: [[CalculatorButton]] = [
        [.clear, .flipSign, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Spacer()
                Text(viewModel.display)
                    .font(.custom(FontFamily.Caprasimo.regular, size: 48))
                    .foregroundColor(.black)
                    .padding()
            }
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        CalculatorButtonView(button: button, viewModel: viewModel)
                    }
                }
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
