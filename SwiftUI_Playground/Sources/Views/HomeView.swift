//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    // State variable to track if the card is flipped
    @State private var isFlipped = false

    var body: some View {
        ZStack {
            // Front View
            if !isFlipped {
                CardFront()
            } else {
                // Back View
                CardBack()
            }
        }
        .frame(width: 250, height: 150)
        .background(Color.clear)
        .cornerRadius(15)
        .shadow(radius: 5)
        // Apply the 3D rotation effect
        .rotation3DEffect(
            .degrees(isFlipped ? 180 : 0),
            axis: (x: 0, y: 1, z: 0)
        )
        // Toggle the isFlipped state on tap
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.6)) {
                isFlipped.toggle()
            }
        }
    }
}

// Front side of the card
struct CardFront: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.blue)
                .frame(width: 250, height: 150)
            Text("Front Side")
                .font(.title)
                .foregroundColor(.white)
        }
    }
}

// Back side of the card
struct CardBack: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.green)
                .frame(width: 250, height: 150)
            Text("Back Side")
                .font(.title)
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
