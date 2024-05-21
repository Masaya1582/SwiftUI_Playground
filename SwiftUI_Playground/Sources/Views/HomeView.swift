//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var angle: Angle = .degrees(0.0)

    var body: some View {
        Image(systemName: "steeringwheel")
            .font(.system(size: 300))
            .shadow(radius: 10)
            .rotationEffect(angle)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        self.angle = value.rotation
                    }
            )
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
