//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var ageInput: String = ""
    @State private var message: String = ""

    var body: some View {
        VStack {
            Text(message)
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
            TextField("Enter your age", text: $ageInput)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)

            Button("Classify Age") {
                classifyAge()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
        .padding()
    }

    private func classifyAge() {
        guard let age = Int(ageInput) else {
            message = "Please enter a valid age."
            return
        }

        switch age {
        case 0...12:
            message = "You are a child."
        case 13...19:
            message = "You are a teen."
        case let adultAge where adultAge >= 20:
            message = "You are an adult."
        default:
            message = "Age classification is not available."
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
