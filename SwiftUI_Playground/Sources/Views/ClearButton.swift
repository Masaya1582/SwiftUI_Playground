//
//  ClearButton.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/06/30.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct ClearButton: ViewModifier {
    @Binding var name: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            // 入力値が空ではない時にバツボタンを表示させる
            if !name.isEmpty {
                Button(action: {
                    self.name = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
            }
        }
    }
}
