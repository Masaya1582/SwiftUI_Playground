//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

enum Theme: String, CaseIterable {
    case light = "Light Theme"
    case dark = "Dark Theme"
    case colorful = "Colorful Theme"

    var backgroundColor: Color {
        switch self {
        case .light:
            return Color.white
        case .dark:
            return Color.black
        case .colorful:
            return Color.blue
        }
    }

    var textColor: Color {
        switch self {
        case .light:
            return Color.black
        case .dark:
            return Color.white
        case .colorful:
            return Color.white
        }
    }
}

struct HomeView: View {
    @State private var selectedTheme = Theme.light

    var body: some View {
        ZStack {
            selectedTheme.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Theme Picker App")
                    .font(.largeTitle)
                    .padding()

                Text("Select a Theme:")
                    .font(.title)
                    .padding()

                Picker("Select Theme", selection: $selectedTheme) {
                    ForEach(Theme.allCases, id: \.self) { theme in
                        Text(theme.rawValue)
                            .font(.title)
                            .tag(theme)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                Text("Selected Theme:")
                    .font(.title)
                    .padding()

                Text(selectedTheme.rawValue)
                    .font(.title)
                    .foregroundColor(selectedTheme.textColor)
                    .padding()
                    .background(selectedTheme.backgroundColor)
                    .cornerRadius(10)
            }
        }
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
