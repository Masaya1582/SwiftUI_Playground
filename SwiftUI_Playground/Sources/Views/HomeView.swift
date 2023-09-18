//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var deviceName: String = ""
    @State private var isWifiEnabled: Bool = false
    @State private var date = Date()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $deviceName)
                    LabeledContent("iOS Version", value: "16.2")
                } header: {
                    Text("About")
                }

                Section {
                    Toggle("Wi-Fi", isOn: $isWifiEnabled)
                        .tint(.pink)
                } header: {
                    Text("Internet")
                }

                Section {
                    DatePicker("Date picker", selection: $date)
                }

                Section {
                    Button("Reset All Content and Settings") {
                        // Reset logic
                    }
                }
            }
            .tint(.pink)
            .navigationBarTitle("Settings")
        }
    }}

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
