//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct RadialDial: View {
    @State private var rotationAngle: Angle = .degrees(0)
    @State private var accumulatedAngle: Angle = .degrees(0)
    @State private var lastFeedbackAngle: Int = 0
    private var dialRadius: CGFloat = 100

    private func triggerHapticFeedback() {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
        feedbackGenerator.impactOccurred()
    }

    private func colorForMark(at index: Int) -> Color {
        let markAngle = Double(index) * 15
        return accumulatedAngle.degrees.truncatingRemainder(dividingBy: 360) >= markAngle ? Color.green : Color.gray.opacity(0.3)
    }

    var body: some View {
        VStack {
            Circle() // Base gray circle
                .stroke(Color.gray.opacity(0.3), lineWidth: 4)
                .frame(width: dialRadius * 2, height: dialRadius * 2)
                .overlay(
                    Circle() // Red circle representing traversed angle
                        .trim(from: 0, to: CGFloat(accumulatedAngle.degrees / 360))
                        .stroke(Color.green, lineWidth: 4)
                        .rotationEffect(.degrees(-90)) // Adjust the starting position
                )
                .overlay(
                    // Draw marks every 10 degrees
                    ForEach(0..<36) { index in
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 2, height: index % 3 == 0 ? 15 : 7)  // Longer marks for every 30 degrees
                            .offset(y: -(dialRadius - (index % 3 == 0 ? 15 : 7)/2))
                            .rotationEffect(.degrees(Double(index) * 10))
                    }
                )
                .overlay(
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 2, height: dialRadius - 15)
                        .offset(y: -(dialRadius - 15)/2)
                        .rotationEffect(rotationAngle)
                        .gesture(DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let vector = CGVector(dx: value.location.x - dialRadius, dy: value.location.y - dialRadius)
                                let angle = atan2(vector.dy, vector.dx)
                                let newRotation = Angle(radians: Double(angle) + .pi/2)

                                if rotationAngle.degrees - newRotation.degrees > 180 {
                                    accumulatedAngle += Angle(degrees: 360 - (rotationAngle.degrees - newRotation.degrees))
                                } else if rotationAngle.degrees - newRotation.degrees < -180 {
                                    accumulatedAngle -= Angle(degrees: 360 + (rotationAngle.degrees - newRotation.degrees))
                                } else {
                                    accumulatedAngle += newRotation - rotationAngle
                                }

                                rotationAngle = newRotation

                                let currentAngle = Int(accumulatedAngle.degrees.truncatingRemainder(dividingBy: 360))
                                if abs(lastFeedbackAngle - currentAngle) >= 20 {
                                    triggerHapticFeedback()
                                    lastFeedbackAngle = currentAngle
                                }

                            }
                        )
                        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 2, y: 2)
                )
        }
    }
}


struct HomeView : View {
    var body : some View {
        RadialDial()
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
