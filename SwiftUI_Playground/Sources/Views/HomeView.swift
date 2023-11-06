//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var tapText = "Tap me"
    @State private var dragText = "Drag me"

    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, SwiftUI!")
                .foregroundColor(.blue)
            Text("Hello, SwiftUI!")
                .font(.title)
            Text("Background Color")
                .background(Color.yellow)
            Text("Fixed Size")
                .frame(width: 80, height: 40)
            Rectangle()
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            Text("Bordered Text")
                .border(Color.red)
            Text("Shadowed Text")
                .shadow(color: Color.black, radius: 4, x: 0, y: 0)
            Text("Rotated Text")
                .rotationEffect(.degrees(45))
            Text("Scaled Text")
                .scaleEffect(1.5)
            Text("Offset Text")
                .offset(x: 20, y: 10)
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
