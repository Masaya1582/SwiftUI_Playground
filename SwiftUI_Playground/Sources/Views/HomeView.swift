//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum MathError: Error {
    case negativeNumber
    case invalidInput
}

struct HomeView: View {
    @State private var inputText = ""
    @State private var resultText = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack {
            Text("Square Root Calculator")
                .font(.largeTitle)

            TextField("Enter a number", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()

            Button("Calculate") {
                do {
                    if let number = Double(inputText) {
                        let result = try calculateSquareRoot(number)
                        resultText = "Square root: \(result)"
                        errorMessage = ""
                    } else {
                        throw MathError.invalidInput
                    }
                } catch MathError.negativeNumber {
                    errorMessage = "Please Enter a non-negative number"
                } catch MathError.invalidInput {
                    errorMessage = "Invalid input. Please enter a valid number"
                } catch {
                    errorMessage = "An unknown error occurred"
                }
            }

            Text(resultText)
                .font(.headline)
                .foregroundColor(.green)
                .padding()

            Text(errorMessage)
                .font(.headline)
                .foregroundColor(.red)
                .padding()
        }
    }

    private func calculateSquareRoot(_ number: Double) throws -> Double {
        guard number >= 0 else {
            throw MathError.negativeNumber
        }

        return sqrt(number)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
