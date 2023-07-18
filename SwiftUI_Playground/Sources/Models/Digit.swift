//
//  Digit.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/17.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine

    var description: String {
        "\(rawValue)"
    }
}
