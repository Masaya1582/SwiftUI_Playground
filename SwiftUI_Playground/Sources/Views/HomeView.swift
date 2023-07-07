//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum AutoJoinHotspotOption: String, CaseIterable, Identifiable {
    var id: Self {
        return self
    }
    case never
    case askToJoin
    case automatic

    var optionString: String {
        switch self {
        case .never:
            return "Never"
        case .askToJoin:
            return "Ask to join"
        case .automatic:
            return "Automatic"
        }
    }
}

struct HomeView: View {
    @AppStorage("deviceName") private var deviceName: String = ""
    @AppStorage("wifi") private var isWifiEnabled: Bool = false
    @AppStorage("autoJoin") private var autoJoinOption: AutoJoinHotspotOption = .never

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("DeviceName", text: $deviceName)
                    LabeledContent("iOS Version", value: "16.5")
                } header: {
                    Text("About")
                }

                Section {
                    Toggle("Wi-Fi", isOn: $isWifiEnabled)
                    Picker("Auto-Join Hotspot", selection: $autoJoinOption) {
                        ForEach(AutoJoinHotspotOption.allCases) { option in
                            Text(option.optionString)
                        }
                    }
                } header: {
                    Text("Internet")
                }

                Section {
                    Button("Reset All Content and Settings") {

                        // Reset logic
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
