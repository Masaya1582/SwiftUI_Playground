//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            DatePicker("⏰", selection: $selectedDate, displayedComponents: [.date])
                .datePickerStyle(WheelDatePickerStyle())

            Text("Selected Date: \(formatDate(selectedDate))")
                .padding()

            Divider()

            Text("Information About Selected Date:")
                .font(.headline)

            Text("Weekday: \(weekday(selectedDate))")
                .padding()

            Text("Time Difference from Today:\n \(timeDifference(from: Date(), to: selectedDate))")
                .padding()

            Spacer()
        }
        .padding()
    }

    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }

    private func weekday(_ date: Date) -> String {
        let calendar = Calendar.current
        let weekdayNumber = calendar.component(.weekday, from: date)
        let weekdayNames = calendar.weekdaySymbols
        return weekdayNames[weekdayNumber - 1]
    }

    private func timeDifference(from startDate: Date, to endDate: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute], from: startDate, to: endDate)

        var timeDifferenceString = ""
        if let days = components.day, days > 0 {
            timeDifferenceString += "\(days) day(s) "
        }
        if let hours = components.hour, hours > 0 {
            timeDifferenceString += "\(hours) hour(s) "
        }
        if let minutes = components.minute {
            timeDifferenceString += "\(minutes) minute(s)"
        }

        return timeDifferenceString
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
