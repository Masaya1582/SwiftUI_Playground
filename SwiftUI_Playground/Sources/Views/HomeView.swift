//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isRunning = false
    @State private var timeRemaining = 60.0
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Fancy Timer")
                    .font(.largeTitle)
                    .foregroundColor(.white)

                Text(String(format: "%.1f", timeRemaining))
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                    .onReceive(timer) { _ in
                        if isRunning && timeRemaining > 0 {
                            timeRemaining -= 1
                        }
                    }

                Stepper("Time Remaining", value: $timeRemaining, in: 0...3600, step: 1)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()

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
                        timeRemaining = 60.0
                    } label: {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 20)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
