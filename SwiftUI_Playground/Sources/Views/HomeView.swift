//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var startDate = Date.now
    @State private var timeElapsed: Int = 0
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 20) {
            Text("Time Elapsed: \(timeElapsed) sec")
                .onReceive(timer) { firedDate in
                    timeElapsed = Int(firedDate.timeIntervalSince(startDate))
                }
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            Button {
                timer.upstream.connect().cancel() // Stop timer
            } label: {
                Text("Stop")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
