//
//  ChatBubble.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/06/30.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct ChatBubble: View {
    var message: ChatMessage

    var body: some View {
        Group {
            if message.isMe {
                HStack {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 2) {
                        Text(message.content)
                            .padding(12)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Text("Sent: \(getMessageSentTime())")
                            .font(.system(size: 8, weight: .medium))
                    }
                }
            } else {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("John")
                            .font(.system(size: 12, weight: .medium))
                        Text(message.content)
                            .padding(12)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
            }
        }
    }

    private func getMessageSentTime() -> String {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date as Date)
    }

}
