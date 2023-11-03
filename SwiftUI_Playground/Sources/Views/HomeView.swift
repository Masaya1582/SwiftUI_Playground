//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var selectedEmoji: String = ""
    private let emojis = [
        "😀", "😍", "🎉", "🎈", "🌟", "🚀", "🍔", "🍦", "🎸", "🎮", "⚽", "📸",
        "🐶", "🐱", "🐻", "🐼", "🦁", "🐮", "🐷", "🐸", "🦉", "🐙", "🦄", "🐴",
        "🚗", "🚲", "✈️", "🚁", "🛴", "🚆",
        "🍕", "🌮", "🍣", "🍩", "🍭", "🍺", "🍸", "🎂", "🍪", "🥂"
    ]

    var body: some View {
        VStack {
            Text("Emoji Picker")
                .modifier(CustomLabel(foregroundColor: .black, size: 28))
                .padding()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 20) {
                    ForEach(emojis, id: \.self) { emoji in
                        EmojiButton(emoji: emoji, selectedEmoji: $selectedEmoji)
                    }
                }
                .padding()
            }
            Text("Selected Emoji: \(selectedEmoji)")
                .modifier(CustomLabel(foregroundColor: .black, size: 28))
        }
    }
}

struct EmojiButton: View {
    var emoji: String
    @Binding var selectedEmoji: String

    var body: some View {
        Button(action: {
            selectedEmoji = emoji
        }) {
            Text(emoji)
                .font(.system(size: 30))
                .frame(width: 60, height: 60)
                .background(selectedEmoji == emoji ? Color.blue : Color.brown)
                .cornerRadius(10)
                .foregroundColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
