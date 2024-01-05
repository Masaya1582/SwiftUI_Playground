//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var count = 3
    @State private var timer: Timer?

    var body: some View {
        VStack {
            if count > 0 {
                Text(String(count))
                    .modifier(CustomLabel(foregroundColor: .black, size: 48))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 120)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 200)
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                    )
            }
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            count -= 1
            if count < 0 {
                timer?.invalidate()
                timer = nil
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
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
