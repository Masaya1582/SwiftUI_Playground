//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isRotating = false

    var body: some View {
        VStack {
            Text("💿")
                .font(.system(size: 200))
                .rotationEffect(.degrees(isRotating ? 360 : 0))
                .animation(isRotating ? Animation.linear(duration: 2).repeatForever(autoreverses: false) : .default)
                .onAppear() {
                    self.isRotating = true
                }
        }
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
