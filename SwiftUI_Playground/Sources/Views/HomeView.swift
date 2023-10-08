//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum DivisionError: Error {
    case divisionByZero
}

struct HomeView: View {
    @State private var dividend: String = ""
    @State private var divisor: String = ""
    @State private var result: String = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            Text("Division Calculator")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
                .padding()

            TextField("Enter dividend", text: $dividend)
                .modifier(CustomTextField(disableAutoCorrection: false))

            TextField("Enter divisor", text: $divisor)
                .modifier(CustomTextField(disableAutoCorrection: false))

            Button("Divide") {
                performDivision()
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))

            if let message = errorMessage {
                Text(message)
                    .foregroundColor(.red)
                    .padding()
            } else {
                Text("Result: \(result)")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
            }
            Spacer()
        }
    }

    private func performDivision() {
        do {
            guard let dividendValue = Double(dividend), let divisorValue = Double(divisor) else {
                errorMessage = "Invalid input"
                return
            }

            if divisorValue == 0 {
                throw DivisionError.divisionByZero
            }

            let quotient = dividendValue / divisorValue
            result = String(quotient)
            errorMessage = nil
        } catch {
            errorMessage = "Error: Division by zero"
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
