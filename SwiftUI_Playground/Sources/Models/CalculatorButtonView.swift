//
//  CalculatorButtonView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/17.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct CalculatorButtonView: View {
    let button: CalculatorButton
    @ObservedObject var viewModel: CalculatorViewModel

    var body: some View {
        Button(action: {
            viewModel.buttonTapped(button: button)
        }) {
            Text(button.title)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: buttonWidth(), height: buttonHeight())
                .background(button.backgroundColor)
                .cornerRadius(buttonWidth() / 2)
        }
    }

    private func buttonWidth() -> CGFloat {
        return UIScreen.main.bounds.width / 6
    }

    private func buttonHeight() -> CGFloat {
        return UIScreen.main.bounds.height / 12
    }
}
