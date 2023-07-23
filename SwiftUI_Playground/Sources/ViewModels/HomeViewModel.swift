// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var name = ""
    @Published var age = 24
    @Published var height = 174.5
    @Published var isHuman = false
}
