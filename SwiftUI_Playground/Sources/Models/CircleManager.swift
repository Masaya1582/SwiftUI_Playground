//
//  CircleManager.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/01.
//

import SwiftUI

class CircleManager: ObservableObject {
    @Published var selectedIndex: Int = 0 // 選択されたボタンのindex番号
    @Published var titleText: String = "" // タイトル用のText
    @Published var selectedSignalColor: Color = Color.white // 選択された信号機の色

    // MARK: - Properties
    let signals = [
        Signal(id: 0, index: 0, name: "Green", color: Asset.Colors.signalGo.swiftUIColor),
        Signal(id: 1, index: 1, name: "Yellow", color: Asset.Colors.signalCareful.swiftUIColor),
        Signal(id: 2, index: 2, name: "Red", color: Asset.Colors.signalStop.swiftUIColor)
    ]

    // MARK: - Methods
    // 選択された信号機の名前、色を表示させる
    func showSelectedSignal() {
        titleText = signals[selectedIndex].name
        selectedSignalColor = signals[selectedIndex].color
    }
}
