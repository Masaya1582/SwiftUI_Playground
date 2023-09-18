//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var decimalInput = ""
    @State private var binaryOutput = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Decimal to Binary Converter")
                .font(.custom(FontFamily.Caprasimo.regular, size: 20))
                .padding()

            TextField("Enter a Decimal Number", text: $decimalInput)
                .modifier(CustomTextField())
                .keyboardType(.numberPad)

            Button("Convert", action: convertToBinary)
                .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))

            Text("Binary Result:")
                .font(.custom(FontFamily.Caprasimo.regular, size: 20))

            Text(binaryOutput)
                .font(.title)
                .padding()

            Spacer()
        }
        .padding()
    }

    private func convertToBinary() {
        if let decimalValue = Int(decimalInput) {
            binaryOutput = String(decimalValue, radix: 2)
        } else {
            binaryOutput = "Invalid Input"
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
