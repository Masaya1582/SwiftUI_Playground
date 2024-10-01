//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    // State variables to hold the user input and calculated result
    @State private var userInput: String = ""
    @State private var result: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Square Root Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            TextField("Enter a number", text: $userInput)
                .padding()
                .keyboardType(.decimalPad)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .shadow(radius: 5)

            Button(action: calculateSquareRoot) {
                Text("Calculate")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.horizontal)

            if !result.isEmpty {
                Text("Result: \(result)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
    }

    // Function to calculate the square root
    func calculateSquareRoot() {
        if let number = Double(userInput), number >= 0 {
            let squareRoot = sqrt(number)
            result = String(format: "%.4f", squareRoot)
        } else {
            result = "Invalid input. Please enter a non-negative number."
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
