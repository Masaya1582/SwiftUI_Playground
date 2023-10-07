//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var eventDate = Date()
    @State private var timeRemaining = TimeInterval()
    private var timeRemainingFormatted: String {
        let hours = Int(timeRemaining) / 3600
        let minutes = Int(timeRemaining) % 3600 / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("Event Countdown")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
                .padding()

            DatePicker("Select Event Date", selection: $eventDate, in: Date()...)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

            Text("Time Remaining")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))

            Text("\(timeRemainingFormatted)")
                .modifier(CustomLabel(foregroundColor: .purple, size: 60))
            Spacer()
        }
        .onAppear {
            calculateTimeRemaining()
        }
        .onReceive(timer) { _ in
            calculateTimeRemaining()
        }
    }

    private func calculateTimeRemaining() {
        let currentDate = Date()
        timeRemaining = eventDate.timeIntervalSince(currentDate)

        if timeRemaining < 0 {
            timeRemaining = 0
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
