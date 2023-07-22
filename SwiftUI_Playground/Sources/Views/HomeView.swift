//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var name: String = ""
    @State private var ageString: String = ""
    @State private var age: Int?

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .padding()

            TextField("Age", text: $ageString)
                .keyboardType(.numberPad)
                .padding()

            Button("Submit") {
                // Convert the ageString to an Int using the Int initializer, which returns an optional Int.
                age = Int(ageString)

                // Check if age is nil (not provided by the user) or if it's less than or equal to 0 (invalid age).
                if let age = age, age > 0 {
                    showMessage("Hello, \(name)! You are \(age) years old.")
                } else {
                    showMessage("Please provide a valid age.")
                }
            }
            .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .orange))
        }
        .padding()
    }

    private func showMessage(_ message: String) {
        // Create a SwiftUI alert to show the message.
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
