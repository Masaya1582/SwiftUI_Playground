//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    // State variable to hold the counter value
    @State private var counter = 0

    var body: some View {
        VStack(spacing: 20) {
            // Display the current value of the counter
            Text("Counter: \(counter)")
                .font(.largeTitle)

            // Increment button
            Button(action: {
                self.counter += 1
            }) {
                Text("Increment")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            // Decrement button
            Button(action: {
                self.counter -= 1
            }) {
                Text("Decrement")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            // Reset button
            Button(action: {
                self.counter = 0
            }) {
                Text("Reset")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
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
