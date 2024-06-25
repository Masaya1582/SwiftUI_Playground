//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var selectedShape: ShapeType?

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    selectedShape = .square
                }) {
                    Text("Square")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {
                    selectedShape = .circle
                }) {
                    Text("Circle")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {
                    selectedShape = .triangle
                }) {
                    Text("Triangle")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()

            Spacer()

            if let shape = selectedShape {
                ShapeView(shape: shape)
                    .frame(width: 200, height: 200)
                    .transition(.opacity)
            } else {
                Text("Tap a button to display a shape")
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .animation(.default, value: selectedShape)
    }
}

enum ShapeType {
    case square, circle, triangle
}

struct ShapeView: View {
    var shape: ShapeType

    var body: some View {
        switch shape {
        case .square:
            Rectangle()
                .fill(Color.blue)
        case .circle:
            Circle()
                .fill(Color.green)
        case .triangle:
            Triangle()
                .fill(Color.red)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
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
