//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()

            ForEach(0..<10) { index in
                Circle()
                    .foregroundColor(.purple)
                    .opacity(0.6)
                    .frame(width: CGFloat.random(in: 50...200), height: CGFloat.random(in: 50...200))
                    .position(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
            }

            ForEach(0..<10) { index in
                Rectangle()
                    .foregroundColor(.green)
                    .opacity(0.6)
                    .frame(width: CGFloat.random(in: 50...200), height: CGFloat.random(in: 50...200))
                    .position(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
            }

            ForEach(0..<10) { index in
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.orange)
                    .opacity(0.6)
                    .frame(width: CGFloat.random(in: 50...200), height: CGFloat.random(in: 50...200))
                    .position(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
            }
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
