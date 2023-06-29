//
//  ChatMessage.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct ChatMessage: Identifiable {
    var id = UUID()
    var content: String
    var isMe: Bool

    init(id: UUID = UUID(), content: String, isMe: Bool) {
        self.id = id
        self.content = content
        self.isMe = isMe
    }
}
