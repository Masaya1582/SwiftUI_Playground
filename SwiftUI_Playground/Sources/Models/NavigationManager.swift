//
//  NavigationManager.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path: [ShowView] = []
}

enum ShowView: Hashable {
    case secondView
    case thirdView
    case forthView
    case fifthView
}
