//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var inputDistance = ""
    @State private var selectedInputUnit = 0
    @State private var selectedOutputUnit = 1

    private let distanceUnits = ["Meters", "Kilometers", "Miles", "Feet"]
    private var convertedDistance: Double {
        let inputValue = Double(inputDistance) ?? 0.0
        let inputUnit = Measurement(value: inputValue, unit: getUnit(for: selectedInputUnit))
        let outputUnit = inputUnit.converted(to: getUnit(for: selectedOutputUnit))
        return outputUnit.value
    }

    var body: some View {
        VStack {
            Text("Distance Converter")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
                .padding(.bottom, 20)

            TextField("Enter distance", text: $inputDistance)
                .modifier(CustomTextField(disableAutoCorrection: false))
                .keyboardType(.decimalPad)
                .padding()

            Picker("Input Unit", selection: $selectedInputUnit) {
                ForEach(0..<distanceUnits.count) {
                    Text(self.distanceUnits[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Picker("Output Unit", selection: $selectedOutputUnit) {
                ForEach(0..<distanceUnits.count) {
                    Text(self.distanceUnits[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Text("\(inputDistance.isEmpty ? "0" : String(format: "%.2f", convertedDistance)) \(distanceUnits[selectedOutputUnit])")
                .modifier(CustomLabel(foregroundColor: .black, size: 32))
                .padding()
            Spacer()
        }
        .padding()
    }

    private func getUnit(for index: Int) -> UnitLength {
        switch index {
        case 0:
            return .meters
        case 1:
            return .kilometers
        case 2:
            return .miles
        case 3:
            return .feet
        default:
            return .meters
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
