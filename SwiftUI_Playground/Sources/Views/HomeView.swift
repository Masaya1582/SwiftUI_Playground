//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var billAmount: String = ""
    @State private var tipPercentage: Double = 15.0
    @State private var numberOfPeople: String = "1"

    private var totalBill: Double {
        let bill = Double(billAmount) ?? 0
        let tip = bill * tipPercentage / 100
        return bill + tip
    }

    private var totalTip: Double {
        let bill = Double(billAmount) ?? 0
        return bill * tipPercentage / 100
    }

    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 1
        return totalBill / max(peopleCount, 1)
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Bill Amount Input
                HStack {
                    Text("Bill Amount:")
                        .font(.headline)
                    Spacer()
                    TextField("Enter bill amount", text: $billAmount)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .padding(10)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                        .frame(width: 150)
                }

                // Tip Percentage Slider
                VStack(alignment: .leading) {
                    Text("Tip Percentage: \(Int(tipPercentage))%")
                        .font(.headline)
                    Slider(value: $tipPercentage, in: 0...30, step: 1)
                        .accentColor(.green)
                }

                // Number of People Input
                HStack {
                    Text("Number of People:")
                        .font(.headline)
                    Spacer()
                    TextField("Enter number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                        .padding(10)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                        .frame(width: 150)
                }

                Divider()

                // Total Tip and Total Per Person
                VStack(spacing: 10) {
                    HStack {
                        Text("Total Tip:")
                            .font(.headline)
                        Spacer()
                        Text("$\(totalTip, specifier: "%.2f")")
                            .font(.title2)
                    }

                    HStack {
                        Text("Total Per Person:")
                            .font(.headline)
                        Spacer()
                        Text("$\(totalPerPerson, specifier: "%.2f")")
                            .font(.title2)
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Tip Calculator")
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
