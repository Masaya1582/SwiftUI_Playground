//
//  Calculator.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

enum CalculationError: Error {
    case divideByZero
}

class Calculator {
    func divide(_ num1: Int, by num2: Int) throws -> Int {
        if num2 == 0 {
            throw CalculationError.divideByZero
        }
        return num1 / num2
    }
}
