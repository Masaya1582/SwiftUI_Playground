//
//  ArithmeticOperation.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/17.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import Foundation

enum ArithmeticOperation: CaseIterable, CustomStringConvertible {
    case addition, subtraction, multiplication, division

    var description: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "−"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        }
    }
}
