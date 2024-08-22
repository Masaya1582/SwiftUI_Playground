//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var inputValue: String = "0"
    @State private var inputUnit: DataUnit = .bytes
    @State private var outputUnit: DataUnit = .bits

    var convertedValue: Double {
        guard let value = Double(inputValue) else { return 0 }
        let bytes = value * inputUnit.conversionFactor
        return bytes / outputUnit.conversionFactor
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Byte-Bit Converter")
                .font(.largeTitle)
                .fontWeight(.bold)

            HStack {
                TextField("Enter value", text: $inputValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)

                Picker("Input Unit", selection: $inputUnit) {
                    ForEach(DataUnit.allCases, id: \.self) { unit in
                        Text(unit.displayName).tag(unit)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }

            HStack {
                Text("Convert to:")

                Picker("Output Unit", selection: $outputUnit) {
                    ForEach(DataUnit.allCases, id: \.self) { unit in
                        Text(unit.displayName).tag(unit)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }

            Text("Result: \(convertedValue, specifier: "%.2f") \(outputUnit.displayName)")
                .font(.title2)
                .fontWeight(.semibold)

            Spacer()
        }
        .padding()
    }
}

enum DataUnit: String, CaseIterable {
    case bytes, kilobytes, megabytes, bits

    var displayName: String {
        switch self {
        case .bytes: return "Bytes"
        case .kilobytes: return "Kilobytes"
        case .megabytes: return "Megabytes"
        case .bits: return "Bits"
        }
    }

    var conversionFactor: Double {
        switch self {
        case .bytes: return 1
        case .kilobytes: return 1024
        case .megabytes: return 1024 * 1024
        case .bits: return 1 / 8.0
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
