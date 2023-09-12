//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let emojis = [
        Emoji(symbol: "😀"),
        Emoji(symbol: "😍"),
        Emoji(symbol: "🥳"),
        Emoji(symbol: "😎"),
        Emoji(symbol: "🎉"),
        Emoji(symbol: "🚀"),
        Emoji(symbol: "🌈"),
        Emoji(symbol: "🦄"),
        Emoji(symbol: "🍔"),
        Emoji(symbol: "🍕"),
        Emoji(symbol: "🍰"),
        Emoji(symbol: "🍦")
    ]
    @State private var selectedEmoji: Emoji?

    var body: some View {
        NavigationView {
            List(emojis) { emoji in
                EmojiRowView(emoji: emoji)
                    .onTapGesture {
                        selectedEmoji = emoji
                    }
            }
            .navigationBarTitle("Emoji Palette")
            .sheet(item: $selectedEmoji) { emoji in
                Text(emoji.symbol)
                    .font(.system(size: 100))
                    .padding()
                    .onTapGesture {
                        copyToClipboard(text: emoji.symbol)
                    }
            }
        }
    }

    private func copyToClipboard(text: String) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = text
    }
}

struct EmojiRowView: View {
    let emoji: Emoji

    var body: some View {
        HStack {
            Spacer()
            Text(emoji.symbol)
                .font(.system(size: 40))
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
