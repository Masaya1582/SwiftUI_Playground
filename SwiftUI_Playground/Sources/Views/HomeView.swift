//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {

    // MARK: - Body
    var body: some View {
        EmojisAnimatedPicker()
    }
}

struct EmojisAnimatedPicker: View {

    let emojis = Emoji.create()

    @State private var selection = [Emoji]()
    @Namespace private var namespace

    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 5)

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(selection) { item in
                        Text(item.content)
                            .foregroundColor(.clear)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: selection.contains(item))
                    }
                }
                .padding()
            }

            Spacer()
            Divider()

            HStack {
                ForEach(emojis) { item in
                    Text(item.content)
                        .matchedGeometryEffect(id: item.id, in: namespace, isSource: !selection.contains(item))
                        .onTapGesture {
                            withAnimation(.spring()) {
                                tapEmoji(item)
                            }
                        }
                }
            }
            .padding()
        }
    }

    func tapEmoji(_ emoji: Emoji) {
        if let index = selection.firstIndex(of: emoji) {
            selection.remove(at: index)
        } else {
            selection.append(emoji)
        }
    }
}

struct Emoji: Identifiable, Hashable {
    let id = UUID()
    let content: String

    static func create() -> [Emoji] {
        ["🪐", "🌍", "🌕", "🌿", "🌊", "🌎", "🌑", "🌞", "🌌", "🎶", "📚"].map { Emoji(content: $0) }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
