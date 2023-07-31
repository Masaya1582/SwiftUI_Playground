//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var number1 = ""
    @State private var number2 = ""
    @State private var result = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 48) {
            TextField("Enter number 1", text: $number1)
                .keyboardType(.numberPad)

            TextField("Enter number 2", text: $number2)
                .keyboardType(.numberPad)

            Button("Divide", action: divideNumbers)
                .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .orange))

            Text(result)
                .font(.largeTitle)
                .foregroundColor(.green)
                .padding()

            Text(errorMessage)
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding()
        }
        .padding()
    }

    func divideNumbers() {
        guard let num1 = Int(number1), let num2 = Int(number2) else {
            errorMessage = "Invalid input"
            return
        }

        do {
            let calculator = Calculator()
            let result = try calculator.divide(num1, by: num2)
            self.result = "Result: \(result)"
            errorMessage = ""
        } catch CalculationError.divideByZero {
            errorMessage = "Cannot divide by zero"
        } catch {
            errorMessage = "An error occurred"
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
