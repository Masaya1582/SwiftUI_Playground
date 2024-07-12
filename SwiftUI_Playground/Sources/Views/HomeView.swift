//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct SignatureView: View {
    @State private var points: [CGPoint] = []

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    guard let firstPoint = points.first else { return }
                    path.move(to: firstPoint)
                    for point in points {
                        path.addLine(to: point)
                    }
                }
                .stroke(Color.black, lineWidth: 2)
                .background(Color.gray.opacity(0.1))
                .gesture(
                    DragGesture(minimumDistance: 0.1)
                        .onChanged { value in
                            let location = value.location
                            if geometry.frame(in: .local).contains(location) {
                                points.append(location)
                            }
                        }
                        .onEnded { value in
                            // Handle signature completion if needed
                        }

                )
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Add your signature here")
            SignatureView()
                .frame(width: 400, height: 200)
                .padding()
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
