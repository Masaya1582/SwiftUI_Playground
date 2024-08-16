//
//  ColorSchemeManager.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/08/17.
//  Copyright (c) 2024 ReNKCHANNEL. All rights reserved.
//

import SwiftUI

final class ColorSchemeManager: ObservableObject {
    @Published var colorScheme: ColorScheme = .light

    func toggleColorScheme() {
        colorScheme = (colorScheme == .light) ? .dark : .light
    }
}
