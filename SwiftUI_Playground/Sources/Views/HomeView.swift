//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var progress = 0.8

    var body: some View {
        HStack {
            VStack(spacing: 20) {
                ProgressView()

                ProgressView(value: 0.2)

                ProgressView("Hello", value: 70, total: 100)

                ProgressView(value: progress) {
                    Text("Label")
                } currentValueLabel: {
                    Text("Value: \(progress)")
                }

            }
            .progressViewStyle(.circular)

            VStack(spacing: 20) {
                ProgressView()

                ProgressView(value: 0.2)

                ProgressView("Label", value: 70, total: 100)

                ProgressView(value: progress) {
                    Text("Label")
                } currentValueLabel: {
                    Text("Current Value Label: \(progress)")
                }

            }
            .progressViewStyle(.linear)
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
