//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var timeElapsed: TimeInterval = 0
    @State private var isRunning = false
    @State private var timer: Timer? = nil

    var body: some View {
        VStack {
            Text("\(timeElapsed.formattedTime())")
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))
                .padding()

            HStack {
                if isRunning {
                    Button(action: stop) {
                        Text("Stop")
                            .font(.custom(FontFamily.Caprasimo.regular, size: 24))
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                } else {
                    Button(action: start) {
                        Text("Start")
                            .font(.custom(FontFamily.Caprasimo.regular, size: 24))
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                Button(action: reset) {
                    Text("Reset")
                        .font(.custom(FontFamily.Caprasimo.regular, size: 24))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }

    private func start() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            timeElapsed += 0.1
        }
    }

    private func stop() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }

    private func reset() {
        stop()
        timeElapsed = 0
    }
}

extension TimeInterval {
    func formattedTime() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        let milliseconds = Int((self.truncatingRemainder(dividingBy: 1)) * 100)

        return String(format: "%02d:%02d:%02d", minutes, seconds, milliseconds)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
