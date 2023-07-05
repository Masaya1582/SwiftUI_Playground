//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum AutoJoinHotspotOption: CaseIterable, Identifiable, CustomStringConvertible {
    case never
    case askToJoin
    case automatic

    var id: AutoJoinHotspotOption {
        self
    }

    var description: String {
        switch self {
        case .never:
            return "Never"
        case .askToJoin:
            return "Ask to Join"
        case .automatic:
            return "Automatic"
        }
    }
}

struct HomeView: View {
    @State private var selectedOption: AutoJoinHotspotOption = .never

    var body: some View {
        Picker("Auto-Join Hotspot", selection: $selectedOption) {
            ForEach(AutoJoinHotspotOption.allCases) { option in
                Text(String(describing: option))
                    .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            }
        }
        .pickerStyle(.wheel)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
