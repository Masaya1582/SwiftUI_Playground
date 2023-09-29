//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var rotationAngle: Double = 0.0

    var body: some View {
        VStack {
            Text("Rotate Circle")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
            Spacer()
            Image(systemName: "arrow.right.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotationAngle))
                .animation(.spring())
            Spacer()
            Slider(value: $rotationAngle, in: 0...360, step: 1.0)
                .padding()
            Text("Rotation Angle: \(Int(rotationAngle))°")
                .modifier(CustomLabel(foregroundColor: .black, size: 18))
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
