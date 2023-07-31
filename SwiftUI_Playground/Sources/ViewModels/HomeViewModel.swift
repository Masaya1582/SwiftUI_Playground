// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var colors: [Color] = [.red, .green, .blue]
}
