//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    // Define length units and the user input
    @State private var inputValue: String = ""
    @State private var selectedUnit: LengthUnit = .millimeter

    // Enum to define different length units
    enum LengthUnit: String, CaseIterable, Identifiable {
        case millimeter = "Millimeters (mm)"
        case centimeter = "Centimeters (cm)"
        case meter = "Meters (m)"
        case kilometer = "Kilometers (km)"
        var id: String { self.rawValue }
    }

    // Function to convert the input value to millimeters
    private func convertToMillimeters(value: Double, unit: LengthUnit) -> Double {
        switch unit {
        case .millimeter:
            return value
        case .centimeter:
            return value * 10
        case .meter:
            return value * 1000
        case .kilometer:
            return value * 1_000_000
        }
    }

    // Function to convert millimeters to other units
    private func convertFromMillimeters(_ millimeters: Double, to unit: LengthUnit) -> Double {
        switch unit {
        case .millimeter:
            return millimeters
        case .centimeter:
            return millimeters / 10
        case .meter:
            return millimeters / 1000
        case .kilometer:
            return millimeters / 1_000_000
        }
    }

    // Computed property for converting the input value
    private var convertedValues: [LengthUnit: Double] {
        guard let input = Double(inputValue) else {
            return [:] // Return an empty dictionary if input is invalid
        }

        let valueInMillimeters = convertToMillimeters(value: input, unit: selectedUnit)
        var results = [LengthUnit: Double]()

        for unit in LengthUnit.allCases {
            results[unit] = convertFromMillimeters(valueInMillimeters, to: unit)
        }

        return results
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // User input section
                TextField("Enter value", text: $inputValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding()

                // Picker to select the unit of the input value
                Picker("Select Unit", selection: $selectedUnit) {
                    ForEach(LengthUnit.allCases) { unit in
                        Text(unit.rawValue).tag(unit)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                // Display converted values
                List {
                    ForEach(LengthUnit.allCases) { unit in
                        if let value = convertedValues[unit] {
                            HStack {
                                Text("\(unit.rawValue):")
                                Spacer()
                                Text(String(format: "%.4f", value))
                            }
                        }
                    }
                }
            }
            .navigationTitle("Length Converter")
        }
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
