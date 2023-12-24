//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isMenuOpen = false

    var body: some View {
        ZStack {
            Button(action: {
                withAnimation {
                    self.isMenuOpen.toggle()
                }
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.purple)
            }

            if isMenuOpen {
                ForEach(0..<5) { index in
                    Button(action: {
                        print("Button \(index) tapped")
                    }) {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.purple)
                    }
                    .offset(x: 100 * cos(CGFloat(index) * (2 * .pi / 5)), y: 100 * sin(CGFloat(index) * (2 * .pi / 5)))
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
