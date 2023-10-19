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

    var isLoginButtonEnabled: Bool {
        return email.contains("@") && password.count >= 8
    }

    var buttonColor: Color {
        return isLoginButtonEnabled ? .orange : .gray
    }
}
