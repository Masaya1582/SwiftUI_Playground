//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    // MARK: - Properties
    @State private var isFlipped = false

    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            // The 3D flip effect is achieved by rotating around the y-axis.
            // We check the state to determine which view to show, front or back.
            if isFlipped {
                BackView()
                    .transition(.asymmetric(insertion: .identity, removal: .opacity))
            } else {
                FrontView()
                    .transition(.asymmetric(insertion: .identity, removal: .opacity))
            }
            Spacer()
        }
        .frame(width: 200, height: 300)
        // We use a 3D effect on tap to flip the card.
        .rotation3DEffect(Angle(degrees: isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            // Animate the flip effect.
            withAnimation {
                isFlipped.toggle()
            }
        }
    }
}

struct FrontView: View {
    var body: some View {
        ZStack {
            Color.blue
            Text("Front")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct BackView: View {
    var body: some View {
        ZStack {
            Color.red
            Text("Back")
                .font(.largeTitle)
                .foregroundColor(.white)
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
