//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Room Image
                Asset.Assets.imgSpaghetti.swiftUIImage
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text("Deluxe Suite")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.6))
                                    .cornerRadius(10)
                                    .padding([.trailing, .bottom], 10)
                            }
                        }
                    )

                // Room Details
                VStack(alignment: .leading, spacing: 8) {
                    Text("Deluxe Suite")
                        .font(.title)
                        .fontWeight(.bold)

                    Text("Enjoy a luxurious stay in our deluxe suite with stunning views of the city skyline. The room features a king-size bed, ensuite bathroom, and modern amenities.")
                        .font(.body)
                        .foregroundColor(.secondary)

                    HStack {
                        Text("Price per night:")
                            .font(.headline)
                        Spacer()
                        Text("$299")
                            .font(.headline)
                            .foregroundColor(.green)
                    }

                    // Room Amenities
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Label("Free Wi-Fi", systemImage: "wifi")
                            Label("King-Size Bed", systemImage: "bed.double")
                        }
                        Spacer()
                        VStack(alignment: .leading, spacing: 4) {
                            Label("Breakfast Included", systemImage: "cup.and.saucer")
                            Label("City View", systemImage: "binoculars")
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.vertical)
                }
                .padding(.horizontal)

                // Reservation Dates
                VStack(alignment: .leading, spacing: 8) {
                    Text("Select Dates")
                        .font(.title2)
                        .fontWeight(.bold)

                    DatePicker("Check-in", selection: .constant(Date()), displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())

                    DatePicker("Check-out", selection: .constant(Date().addingTimeInterval(86400)), displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                .padding(.horizontal)

                // Book Now Button
                Button(action: {
                    // Handle booking action
                }) {
                    Text("Book Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Hotel Room")
        .navigationBarTitleDisplayMode(.inline)
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
