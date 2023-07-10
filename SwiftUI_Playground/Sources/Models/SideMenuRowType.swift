//
//  SideMenuRowType.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

enum SideMenuRowType: Int, CaseIterable {
    case home = 0
    case favorite
    case chat
    case profile

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
    }

    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "heart"
        case .chat:
            return "cup.and.saucer"
        case .profile:
            return "face.smiling"
        }
    }
}
