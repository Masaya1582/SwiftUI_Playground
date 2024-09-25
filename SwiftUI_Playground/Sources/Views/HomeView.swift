//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    // A list of countries to display in the picker
    private let countries = ["United States", "Canada", "United Kingdom", "Germany", "France", "Australia", "India", "Japan", "China", "Brazil"]

    // The selected country
    @State private var selectedCountry = "United States" // Default selection

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select Your Country")) {
                    // Picker for countries
                    Picker("Country", selection: $selectedCountry) {
                        ForEach(countries, id: \.self) { country in
                            Text(country).tag(country)
                        }
                    }
                    .pickerStyle(MenuPickerStyle()) // This is where the pull-down menu style is applied
                }

                // Display the selected country
                Section(header: Text("You selected")) {
                    Text(selectedCountry)
                }
            }
            .navigationBarTitle("Country Picker", displayMode: .inline)
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
