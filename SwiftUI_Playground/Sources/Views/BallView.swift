//
//  BallView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/09/16.
//

import SwiftUI

struct BouncingBallView: View {
    @State private var bounce = false

    var body: some View {
        BouncingBallShape()
            .frame(width: 100, height: 100)
            .foregroundColor(Color.blue)
            .offset(y: bounce ? -150 : 150)
            .animation(
                Animation.easeInOut(duration: 1)
                    .repeatForever(autoreverses: true)
            )
            .onAppear() {
                bounce.toggle()
            }
    }
}

struct BouncingBallShape: Shape, Animatable {
    var animatableData: CGFloat {
        get { bounceAmount }
        set { bounceAmount = newValue }
    }

    private var bounceAmount: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        let diameter = rect.size.width
        let radius = diameter / 2
        let centerY = rect.origin.y + radius + (radius * 2 * (1 - bounceAmount))
        let center = CGPoint(x: rect.midX, y: centerY)
        let path = Path { p in
            p.addArc(center: center, radius: radius, startAngle: .zero, endAngle: .radians(.pi * 2), clockwise: true)
        }
        return path
    }
}
