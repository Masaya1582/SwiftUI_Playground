//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var inputNumber: String = ""
    @State private var selectedBase: Base = .decimal

    enum Base: String, CaseIterable, Identifiable {
        case binary = "Binary (2)"
        case octal = "Octal (8)"
        case decimal = "Decimal (10)"
        case hexadecimal = "Hexadecimal (16)"

        var id: String { self.rawValue }

        var base: Int {
            switch self {
            case .binary: return 2
            case .octal: return 8
            case .decimal: return 10
            case .hexadecimal: return 16
            }
        }
    }

    var convertedValues: [Base: String] {
        var values: [Base: String] = [:]
        guard let number = Int(inputNumber, radix: selectedBase.base) else {
            return Base.allCases.reduce(into: [:]) { $0[$1] = "Invalid Input" }
        }

        for base in Base.allCases {
            values[base] = String(number, radix: base.base).uppercased()
        }

        return values
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    TextField("Enter number", text: $inputNumber)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    Picker("Select Base", selection: $selectedBase) {
                        ForEach(Base.allCases) { base in
                            Text(base.rawValue).tag(base)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Conversions")) {
                    ForEach(Base.allCases) { base in
                        if base != selectedBase {
                            HStack {
                                Text("\(base.rawValue):")
                                Spacer()
                                Text(convertedValues[base] ?? "Invalid Input")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Base Converter")
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
