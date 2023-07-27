//
//  HomeModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

class ThemeSettings: ObservableObject {
    @Published var themeColor: Color = .blue
}
