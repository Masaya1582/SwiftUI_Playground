//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var selectedFlight: Flight?

    let flights = [
        Flight(airline: "Airline A", departure: "10:00 AM", arrival: "1:00 PM", duration: "3h", price: "$300"),
        Flight(airline: "Airline B", departure: "11:00 AM", arrival: "2:00 PM", duration: "3h", price: "$320"),
        Flight(airline: "Airline C", departure: "12:00 PM", arrival: "3:00 PM", duration: "3h", price: "$350")
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Select Your Flight")
                    .font(.largeTitle)
                    .padding()

                List(flights) { flight in
                    FlightRow(flight: flight)
                        .onTapGesture {
                            withAnimation {
                                selectedFlight = flight
                            }
                        }
                }
                .listStyle(PlainListStyle())

                if let flight = selectedFlight {
                    FlightDetailView(flight: flight)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                }
            }
            .navigationTitle("Flight Reservation")
        }
    }
}

struct FlightRow: View {
    let flight: Flight

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(flight.airline)
                    .font(.headline)
                Text("\(flight.departure) - \(flight.arrival)")
                    .font(.subheadline)
            }
            Spacer()
            Text(flight.price)
                .font(.headline)
        }
        .padding()
    }
}

struct FlightDetailView: View {
    let flight: Flight

    var body: some View {
        VStack {
            Text("Flight Details")
                .font(.title2)
                .padding(.top)

            Text("Airline: \(flight.airline)")
                .font(.headline)

            Text("Departure: \(flight.departure)")
                .font(.subheadline)

            Text("Arrival: \(flight.arrival)")
                .font(.subheadline)

            Text("Duration: \(flight.duration)")
                .font(.subheadline)

            Text("Price: \(flight.price)")
                .font(.subheadline)

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
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
