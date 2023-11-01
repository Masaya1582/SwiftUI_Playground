//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

enum BeverageType: String, CaseIterable {
    case coffee = "Coffee"
    case tea = "Tea"
    case juice = "Juice"
}

struct HomeView: View {
    @State private var selectedBeverage: BeverageType = .coffee

    var body: some View {
        VStack {
            Picker("Select a Beverage", selection: $selectedBeverage) {
                ForEach(BeverageType.allCases, id: \.self) { beverage in
                    Text(beverage.rawValue).tag(beverage)
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            Text("Your Selected: \(selectedBeverage.rawValue)")
                .padding()
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
        }
        .padding()
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
