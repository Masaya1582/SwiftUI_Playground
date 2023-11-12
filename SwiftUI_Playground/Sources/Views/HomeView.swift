//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var timeElapsed: TimeInterval = 0
    @State private var timer: Timer?
    @State private var isRunning = false

    var body: some View {
        VStack {
            Text("Stopwatch")
                .font(.title)
                .foregroundColor(.blue)

            Text(timeString(timeElapsed))
                .font(.system(size: 50, weight: .bold, design: .default))
                .foregroundColor(isRunning ? .green : .black)
                .padding()

            HStack(spacing: 20) {
                Button(action: {
                    self.startStopwatch()
                }) {
                    Image(systemName: isRunning ? "pause.circle" : "play.circle")
                        .font(.system(size: 30))
                        .foregroundColor(isRunning ? .red : .green)
                }

                Button(action: {
                    self.resetStopwatch()
                }) {
                    Image(systemName: "arrow.counterclockwise.circle")
                        .font(.system(size: 30))
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .onAppear(perform: {
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                if self.isRunning {
                    self.timeElapsed += 0.1
                }
            }
        })
    }

    private func startStopwatch() {
        isRunning.toggle()
    }

    private func resetStopwatch() {
        timeElapsed = 0
        isRunning = false
    }

    // Function to format time as a string
    private func timeString(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let tenths = Int((time.truncatingRemainder(dividingBy: 1)) * 10)
        return String(format: "%02d:%02d.%d", minutes, seconds, tenths)
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
