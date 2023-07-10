//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum ColorChoice: String, CaseIterable {
    case red
    case green
    case blue
    case yellow

    var color: Color {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        case .yellow:
            return .yellow
        }
    }

    var displayName: String {
        return self.rawValue.capitalized
    }
}

struct HomeView: View {
    @State private var selectedColor: ColorChoice = .red

    var body: some View {
        VStack {
            Text("Selected Color:")
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))
                .padding()

            Circle()
                .foregroundColor(selectedColor.color)
                .frame(width: 200, height: 200)

            Picker(selection: $selectedColor, label: Text("Select a Color")) {
                ForEach(ColorChoice.allCases, id: \.self) { color in
                    Text(color.displayName)
                        .tag(color)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
