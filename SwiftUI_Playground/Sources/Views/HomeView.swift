//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var color: Color = .white
    @State private var colorCode: String = ""
    @State private var showingColorPicker = false
    @State private var selectedLanguage: String = "English"
    private let languages = ["English", "Spanish", "French", "German"]

    var body: some View {
        NavigationView {
            VStack {
                Text("Color Converter Oktava")
                    .font(.title)
                    .padding()

                Rectangle()
                    .fill(color)
                    .frame(height: 200)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                    .padding()

                Text("Color Code: \(colorCode)")
                    .font(.headline)
                    .padding()

                Button("Pick a Color") {
                    showingColorPicker = true
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)

                Picker("Language", selection: $selectedLanguage) {
                    ForEach(languages, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding()

                Spacer()

                Button("Exit") {
                    exit(0)
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .cornerRadius(8)
            }
            .navigationTitle("CCO")
            .sheet(isPresented: $showingColorPicker) {
                ColorPicker("Pick a Color", selection: $color)
                    .onChange(of: color) { newValue in
                        colorCode = newValue.toHex()
                    }
            }
        }
    }
}

extension Color {
    func toHex() -> String {
        let components = UIColor(self).cgColor.components
        let r: CGFloat = components?[0] ?? 0
        let g: CGFloat = components?[1] ?? 0
        let b: CGFloat = components?[2] ?? 0
        return String(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
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
