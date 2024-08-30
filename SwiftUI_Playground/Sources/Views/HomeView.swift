//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    var body: some View {
        RadioButtonView()
    }
}

struct RadioButtonView: View {
    @State private var selectedOption: String? = nil
    private let options = ["Option 1", "Option 2", "Option 3", "Option 4"]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Select an Option:")
                .font(.headline)

            ForEach(options, id: \.self) { option in
                RadioButton(text: option, isSelected: selectedOption == option)
                    .onTapGesture {
                        selectedOption = option
                    }
            }

            Spacer()

            if let selectedOption = selectedOption {
                Text("You selected: \(selectedOption)")
                    .font(.subheadline)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
            } else {
                Text("Please select an option")
                    .font(.subheadline)
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct RadioButton: View {
    let text: String
    let isSelected: Bool

    var body: some View {
        HStack {
            Circle()
                .strokeBorder(isSelected ? Color.blue : Color.gray, lineWidth: 2)
                .background(Circle().fill(isSelected ? Color.blue : Color.clear))
                .frame(width: 24, height: 24)

            Text(text)
                .font(.body)
                .foregroundColor(isSelected ? Color.blue : Color.primary)

            Spacer()
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .shadow(radius: isSelected ? 5 : 0)
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
