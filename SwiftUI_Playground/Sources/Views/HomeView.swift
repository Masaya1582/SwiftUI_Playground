//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var progress: Double = 0.0
    private let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()

    var body: some View {
        GroupBox {
            ProgressView("Loading")
                .progressViewStyle(.circular)
                .padding()
        }
        List {
            HStack {
                Text("Circular progress in a list")
                Spacer()
                ProgressView()
                    .progressViewStyle(.circular)
            }
            ProgressView(value: progress, total: 100) {
                Text("Linear Progress...")
            } currentValueLabel: {
                Text("\(Int(progress))%")
            }.tint(.purple)
                .progressViewStyle(.linear)
                .onReceive(timer) { _ in
                    if progress < 100 {
                        progress += 1
                    } else {
                        progress = 0
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
