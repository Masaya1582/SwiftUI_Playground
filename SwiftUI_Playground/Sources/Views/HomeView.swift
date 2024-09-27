//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    // State variables to store the selected date
    @State private var selectedDate: Date = Date()

    var body: some View {
        VStack(spacing: 20) {
            // Title for the view
            Text("Select a Date")
                .font(.largeTitle)
                .bold()

            // Date Picker with custom styling
            DatePicker("Choose your date:",
                       selection: $selectedDate,
                       displayedComponents: [.date])
            .datePickerStyle(GraphicalDatePickerStyle())
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemGray6)))
            .padding()

            // Display the selected date
            Text("Selected Date: \(formattedDate(selectedDate))")
                .font(.headline)
                .padding()

            // Additional information to make the view richer
            HStack {
                Text("Today is: ")
                    .font(.subheadline)
                Text("\(formattedDate(Date()))")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }

            Spacer()
        }
        .padding()
    }

    // Helper function to format date
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
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
