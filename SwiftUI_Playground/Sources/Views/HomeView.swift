//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var waveOffset: CGFloat = 0

    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            WaveShape(offset: waveOffset)
                .fill(Color.white)
                .opacity(0.7)
                .blendMode(.overlay)
                .frame(height: 200)
                .shadow(color: .black, radius: 5, x: 0, y: 5)
        }
        .onReceive(timer) { _ in
            withAnimation(Animation.linear(duration: 1)) {
                self.waveOffset += 5
            }
        }
    }
}

struct WaveShape: Shape {
    var offset: CGFloat

    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let midHeight = height / 2
        let waveHeight: CGFloat = 20

        var path = Path()
        path.move(to: CGPoint(x: 0, y: midHeight))

        for x in stride(from: 0, through: width, by: 10) {
            let y = midHeight + sin((CGFloat(x) + offset) * 0.05) * waveHeight
            path.addLine(to: CGPoint(x: x, y: y))
        }

        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.closeSubpath()

        return path
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
