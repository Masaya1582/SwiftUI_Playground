//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct FlowerShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Center of the flower
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius: CGFloat = min(rect.width, rect.height) / 2

        // Number of petals
        let petalCount = 5
        let petalArc: CGFloat = .pi * 2 / CGFloat(petalCount)

        for i in 0..<petalCount {
            let angle = petalArc * CGFloat(i)
            let petalCenter = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
            let petalRadius = radius / 3 // Adjust for petal size

            // Draw each petal as a circle
            path.addEllipse(in: CGRect(x: petalCenter.x - petalRadius, y: petalCenter.y - petalRadius, width: petalRadius * 2, height: petalRadius * 2))
        }

        // Draw the center of the flower
        path.addEllipse(in: CGRect(x: center.x - radius / 4, y: center.y - radius / 4, width: radius / 2, height: radius / 2))

        return path
    }
}

struct HomeView: View {
    @State private var isBloomed = false

    var body: some View {
        VStack {
            FlowerShape()
                .fill(isBloomed ? Color.pink : Color.green)
                .scaleEffect(isBloomed ? 1 : 0.1)
                .opacity(isBloomed ? 1 : 0)
                .animation(.easeInOut(duration: 2), value: isBloomed)
                .padding(50)

            Button(action: {
                withAnimation {
                    isBloomed.toggle()
                }
            }) {
                Text(isBloomed ? "Close" : "Bloom")
                    .foregroundColor(.white)
                    .padding()
                    .background(isBloomed ? Color.red : Color.blue)
                    .cornerRadius(10)
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
