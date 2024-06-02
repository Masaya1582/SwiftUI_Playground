//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var selectedDate = Date()
    @State private var numberOfGuests = 1
    @State private var specialRequests = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Reservation Details")) {
                    DatePicker("Date and Time", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(GraphicalDatePickerStyle())

                    Stepper(value: $numberOfGuests, in: 1...20) {
                        Text("Number of Guests: \(numberOfGuests)")
                    }

                    TextField("Special Requests", text: $specialRequests)
                }

                Button(action: submitReservation) {
                    Text("Book Reservation")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationTitle("Book a Table")
        }
        .background(Color.blue.opacity(0.1))
    }

    func submitReservation() {
        // Placeholder for reservation submission logic
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
