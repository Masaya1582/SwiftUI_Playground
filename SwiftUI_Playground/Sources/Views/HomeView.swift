//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var text: String = ""
    @ObservedObject var keyboard: KeyboardObserver = KeyboardObserver()

    var body: some View {
        VStack(spacing: 32) {
            TextField("Input Your Text", text: $text)
                .padding()
            Text("KeyboardHeight: \(keyboard.height)")
                .font(.custom(FontFamily.Caprasimo.regular, size: 20))
            Text("\(keyboard.isShowing ? "Keyboard Is Showing" : "Keyboard Is Not Showing")")
                .font(.custom(FontFamily.Caprasimo.regular, size: 20))
            Spacer()
        }.onAppear {
            self.keyboard.addObserver()
        }.onDisappear {
            self.keyboard.removeObserver()
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
