//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var progress: Double = 0

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                CircularProgressView(progress: progress)
                Text("\(progress * 100, specifier: "%.0f")")
                    .font(.largeTitle)
                    .bold()
            }
            .frame(width: 240, height: 240)
            Spacer()
            HStack {
                Slider(value: $progress, in: 0...1)
                Button("Reset") {
                    progress = 0
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
