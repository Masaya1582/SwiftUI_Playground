//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var bmiResult: String = "Enter your height and weight"
    @State private var category: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Height (m)", text: $height)
                    .padding()
                    .keyboardType(.decimalPad)
                    .border(Color.gray, width: 0.5)
                    .padding([.leading, .trailing, .top])

                TextField("Weight (kg)", text: $weight)
                    .padding()
                    .keyboardType(.decimalPad)
                    .border(Color.gray, width: 0.5)
                    .padding([.leading, .trailing])

                Button(action: calculateBMI) {
                    Text("Calculate BMI")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                Text(bmiResult)
                    .font(.title)
                    .padding()

                Text(category)
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .navigationTitle("BMI Calculator")
        }
    }

    private func calculateBMI() {
        guard let weightValue = Double(weight), let heightValue = Double(height) else {
            bmiResult = "Invalid input"
            return
        }

        let bmi = weightValue / (heightValue * heightValue)
        bmiResult = String(format: "Your BMI: %.2f", bmi)

        switch bmi {
        case ..<18.5:
            category = "Underweight"
        case 18.5..<25:
            category = "Normal weight"
        case 25..<30:
            category = "Overweight"
        default:
            category = "Obese"
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
