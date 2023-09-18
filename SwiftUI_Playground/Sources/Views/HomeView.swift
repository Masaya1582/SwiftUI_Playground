//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var input = ""
    @State private var output = ""
    @State private var isBinaryToDecimal = false

    var body: some View {
        VStack(spacing: 20) {
            Text(isBinaryToDecimal ? "Decimal to Binary" : "Binary to Decimal")
                .font(.custom(FontFamily.Caprasimo.regular, size: 20))
                .padding()

            Toggle("Convert Mode", isOn: $isBinaryToDecimal)
                .font(.custom(FontFamily.Caprasimo.regular, size: 20))
                .padding()

            TextField(isBinaryToDecimal ? "Enter Decimal Number" : "Enter Binary Number", text: $input)
                .modifier(CustomTextField())
                .keyboardType(isBinaryToDecimal ? .decimalPad : .numberPad)

            Button("Convert", action: convert)
                .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))

            Text(isBinaryToDecimal ? "Binary Result:" : "Decimal Result:")
                .font(.custom(FontFamily.Caprasimo.regular, size: 20))

            Text(output)
                .font(.custom(FontFamily.Caprasimo.regular, size: 40))
                .padding()

            Spacer()
        }
        .onChange(of: isBinaryToDecimal) { _ in
            input = ""
            output = ""
        }
        .padding()
    }

    private func convert() {
        if isBinaryToDecimal {
            if let decimalValue = Int(input) {
                output = String(decimalValue, radix: 2)
            } else {
                output = "Invalid Input"
            }
        } else {
            if let binaryValue = Int(input, radix: 2) {
                output = String(binaryValue)
            } else {
                output = "Invalid Input"
            }
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
