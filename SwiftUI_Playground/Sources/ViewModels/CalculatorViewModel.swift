// 
//  CalculatorViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var display = "0"

    private var firstOperand: Double = 0
    private var secondOperand: Double = 0
    private var currentOperation: CalculatorButton?
    private var clearDisplayOnNextInput = false

    func buttonTapped(button: CalculatorButton) {
        switch button {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            processNumber(button)
        case .plus, .minus, .multiply, .divide:
            processOperation(button)
        case .equals:
            performCalculation()
        case .decimal:
            addDecimalPoint()
        case .clear:
            clearDisplay()
        case .flipSign:
            flipDisplaySign()
        }
    }

    private func processNumber(_ button: CalculatorButton) {
        if clearDisplayOnNextInput {
            display = "0"
            clearDisplayOnNextInput = false
        }

        if display == "0" {
            display = button.title
        } else {
            display += button.title
        }
    }

    private func processOperation(_ button: CalculatorButton) {
        if let value = Double(display) {
            firstOperand = value
            currentOperation = button
            clearDisplayOnNextInput = true
        }
    }

    private func performCalculation() {
        if let value = Double(display) {
            secondOperand = value

            switch currentOperation {
            case .plus:
                display = "\(firstOperand + secondOperand)"
            case .minus:
                display = "\(firstOperand - secondOperand)"
            case .multiply:
                display = "\(firstOperand * secondOperand)"
            case .divide:
                display = "\(firstOperand / secondOperand)"
            default:
                break
            }

            currentOperation = nil
        }
    }

    private func addDecimalPoint() {
        if !display.contains(".") {
            display += "."
        }
    }

    private func clearDisplay() {
        display = "0"
        firstOperand = 0
        secondOperand = 0
        currentOperation = nil
    }

    private func flipDisplaySign() {
        if let value = Double(display) {
            display = "\(value * -1)"
        }
    }
}
