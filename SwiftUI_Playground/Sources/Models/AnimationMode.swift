//
//  HomeModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

enum AnimationMode: Int, CaseIterable {
    case apple
    case iphone
    case run
    case baseball

    var imageName: String {
        switch self {
        case .run:
            return "figure.run"
        case .iphone:
            return "iphone"
        case .apple:
            return "apple.logo"
        case .baseball:
            return "figure.baseball"
        }
    }
    var title: String {
        switch self {
        case .run:
            return "Run"
        case .iphone:
            return "iPhone"
        case .apple:
            return "Apple"
        case .baseball:
            return "Baseball"
        }
    }
}
