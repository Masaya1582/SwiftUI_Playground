//
//  DefaultModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case decimal, clear, flipSign

    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .equals: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "x"
        case .divide: return "/"
        case .decimal: return "."
        case .clear: return "AC"
        case .flipSign: return "+/-"
        }
    }

    var backgroundColor: Color {
        switch self {
        case .equals, .plus, .minus, .multiply, .divide:
            return Color.orange
        case .clear, .flipSign:
            return Color.gray
        default:
            return Color(UIColor.darkGray)
        }
    }
}
