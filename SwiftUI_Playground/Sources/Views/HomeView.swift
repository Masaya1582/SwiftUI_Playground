//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isBlossomed = false

    var body: some View {
        ZStack {
            ForEach(0..<6) { petalIndex in
                PetalView(petalIndex: petalIndex, isBlossomed: isBlossomed)
            }
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                self.isBlossomed.toggle()
            }
        }
    }
}

struct PetalView: View {
    let petalIndex: Int
    let isBlossomed: Bool

    var body: some View {
        let rotationAngle = Angle.degrees(Double(petalIndex) * 60)

        return Capsule()
            .fill(isBlossomed ? Color.pink : Color.red)
            .frame(width: 50, height: 100)
            .rotationEffect(isBlossomed ? rotationAngle : .zero)
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
