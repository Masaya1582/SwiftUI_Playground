//
//  TextFieldViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class TextFieldViewModel: ObservableObject {
    @Published var number = "" {
        didSet {
            let numeralsOnlyInput = number.allSatisfy { $0.isNumber } // 数字以外は受け付けない
            if !numeralsOnlyInput {
                self.number = oldValue
            }
        }
    }
}
