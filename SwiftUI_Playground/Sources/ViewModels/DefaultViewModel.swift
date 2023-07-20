// 
//  DefaultViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import RxSwift
import RxCocoa

class DefaultViewModel: ObservableObject {
    @Published var name = ""
    @Published var age = 24
    @Published var height = 174.5
    @Published var isHuman = false
}
