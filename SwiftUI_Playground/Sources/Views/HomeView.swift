//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var drawing: Path = Path()
    @State private var strokeColor: Color = .black
    @State private var strokeWidth: CGFloat = 4.0

    var body: some View {
        VStack {
            CanvasView(drawing: $drawing, strokeColor: $strokeColor, strokeWidth: $strokeWidth)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            let currentPoint = value.location
                            drawing.addLine(to: currentPoint)
                        }
                        .onEnded { _ in
                            drawing.move(to: .zero)
                        }
                )

            HStack {
                ColorPicker("Brush Color", selection: $strokeColor)
                    .padding()

                Slider(value: $strokeWidth, in: 1...20, step: 1)
                    .padding()

                Button(action: {
                    drawing = Path()
                }) {
                    Text("Clear")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

struct CanvasView: View {
    @Binding var drawing: Path
    @Binding var strokeColor: Color
    @Binding var strokeWidth: CGFloat

    var body: some View {
        DrawingCanvas(drawing: drawing)
            .stroke(strokeColor, lineWidth: strokeWidth)
    }
}

struct DrawingCanvas: Shape {
    var drawing: Path

    func path(in rect: CGRect) -> Path {
        return drawing
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
