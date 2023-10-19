// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var message = ""
    @Published var showAlert = false
}
