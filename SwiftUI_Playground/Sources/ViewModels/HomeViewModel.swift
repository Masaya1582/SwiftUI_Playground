// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var toast: FancyToast?
    @Published var toastTitleArray = ["Error", "Warning", "Success", "Info"]
    @Published var toastColorArray: [Color] = [.red, .yellow, .green, .blue]
    @Published var toastArray = [
        FancyToast(type: .error, title: "Toast Error", message: "Toast message"),
        FancyToast(type: .warning, title: "Toast Warning", message: "Toast message"),
        FancyToast(type: .success, title: "Toast Success", message: "Toast message"),
        FancyToast(type: .info, title: "Toast Info", message: "Toast message")
    ]
}
