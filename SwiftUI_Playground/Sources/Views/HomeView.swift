//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import CoreMotion

struct HomeView: View {
    private let altimator = Altimator()
    @State var pressureValue = 0.0

    var body: some View {
        VStack {
            Text(String(format: "%.2f", pressureValue))
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            Text("hPa")
                .font(.title)
                .fontWeight(.semibold)
            startButton
            stopButton
        }
    }

    private var startButton: some View {
        Button {
            altimator.startUpdate { value in
                self.pressureValue = value
            }
        } label: {
            Text("測定開始")
        }
        .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .orange))
    }

    private var stopButton: some View {
        Button {
            altimator.stopUpdate()
        } label: {
            Text("測定終了")
        }
        .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .gray))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
