//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTime = Date()
    @State private var remainingTime = 0
    @State private var isTimerRunning = false
    @State private var timer: Timer?

    var body: some View {
        VStack {
            DatePicker(selection: $selectedTime, displayedComponents: .hourAndMinute) {
                EmptyView()
            }
            .labelsHidden()
            .datePickerStyle(WheelDatePickerStyle())
            Text("Timer: \(formatTime(remainingTime))")
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))
                .padding()
            if isTimerRunning {
                Button("Stop") {
                    stopTimer()
                }
                .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .orange))
            } else {
                Button("Start") {
                    startTimer()
                }
                .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .green))
            }
            Spacer().frame(height: 120)
        }
        .padding()
    }

    private func startTimer() {
        remainingTime = Int(selectedTime.timeIntervalSinceNow)
        isTimerRunning = true

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                stopTimer()
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
        remainingTime = 0
    }

    private func formatTime(_ time: Int) -> String {
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600) % 60

        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
