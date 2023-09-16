//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var rotationAngle: Angle = .zero

    var body: some View {
        VStack {
            Text("Rotate the Square")
                .font(.largeTitle)
                .padding()

            RotatingSquareView()
                .padding()

            Text("Pinch to Rotate")
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
}

struct RotatingSquareView: View {
    @State private var rotationAngle: Angle = .zero

    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200)
            .foregroundColor(Color.blue)
            .cornerRadius(20)
            .rotationEffect(rotationAngle)
            .gesture(
                RotationGesture()
                    .onChanged { angle in
                        rotationAngle = angle
                    }
                    .onEnded { _ in
                        // Optionally, you can add logic when the gesture ends
                    }
            )
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
