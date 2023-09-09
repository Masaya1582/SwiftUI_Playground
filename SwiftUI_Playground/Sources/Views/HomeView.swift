//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isRunning = false
    @State private var elapsedTime = 0.0
    private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Stopwatch")
                    .font(.largeTitle)
                    .foregroundColor(.white)

                Text(String(format: "%.1f", elapsedTime))
                    .font(.system(size: 80))
                    .foregroundColor(.white)

                HStack {
                    Button {
                        isRunning.toggle()
                    } label: {
                        Image(systemName: isRunning ? "pause.circle.fill" : "play.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }

                    Button {
                        isRunning = false
                        elapsedTime = 0.0
                    } label: {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 20)
            }
        }
        .onReceive(timer) { _ in
            if isRunning {
                elapsedTime += 0.1
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
