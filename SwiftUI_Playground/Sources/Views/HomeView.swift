//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var timeElapsed: TimeInterval = 0.0
    @State private var isRunning = false
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Spacer()
            Text(timeElapsed.formatTime())
                .font(.system(size: 60, weight: .thin, design: .monospaced))
                .padding()

            HStack(spacing: 40) {
                Button(action: {
                    toggleTimer()
                }) {
                    Image(systemName: isRunning ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                }

                Button(action: {
                    resetTimer()
                }) {
                    Image(systemName: "gobackward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
            }
            .padding()

            Spacer()
        }
    }

    private func toggleTimer() {
        if isRunning {
            timer?.invalidate()
            timer = nil
        } else {
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                timeElapsed += 0.01
            }
        }
        isRunning.toggle()
    }

    private func resetTimer() {
        timer?.invalidate()
        timer = nil
        timeElapsed = 0.0
        isRunning = false
    }
}

extension TimeInterval {
    func formatTime() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        let milliseconds = Int(self * 100) % 100
        return String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
