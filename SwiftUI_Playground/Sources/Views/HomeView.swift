//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var animatableProgress: CGFloat = 0
    @State private var showText = false
    @State private var displayedName = ""

    private let names = ["Michael ScoField", "Lincoln Burrows"]
    private let letterAnimationDuration = 0.2
    private let nameTransitionDuration = 0.5

    var body: some View {
        VStack {
            ZStack {
                ThreadsIcon()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(width: 200, height: 200)

                ThreadsIcon()
                    .trim(from: 0, to: animatableProgress)
                    .stroke(style: StrokeStyle(lineWidth: 50, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.black)
                    .animation(
                        Animation.easeInOut(duration: 2)
                            .repeatForever(autoreverses: true)
                    )
                    .frame(width: 200, height: 200)
                    .mask(
                        GeometryReader { geometry in
                            Path { path in
                                path.addPath(
                                    ThreadsIcon()
                                        .trim(from: 0, to: animatableProgress)
                                        .path(in: CGRect(x: 0, y: 0, width: geometry.size.width, height: geometry.size.height))
                                )
                            }
                            .fill(Color.white)
                        }
                    )

                VStack {
                    Spacer()
                    if showText {
                        VStack {
                            Text("Created By")
                                .font(.headline)
                                .foregroundColor(.black)

                            Text(displayedName)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .transition(.opacity)
                                .padding(.bottom, 10)
                        }
                    }
                }
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                animatableProgress = 1
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showText = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    writeName(name: names[0])
                }
            }
        }
    }

    private func writeName(name: String) {
        var currentIndex = 0

        Timer.scheduledTimer(withTimeInterval: letterAnimationDuration, repeats: true) { timer in
            if currentIndex < name.count {
                let endIndex = name.index(name.startIndex, offsetBy: currentIndex)
                displayedName += String(name[endIndex])
                currentIndex += 1
            } else {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    removeName(name: name)
                }
            }
        }
    }

    private func removeName(name: String) {
        if name == names[0] {
            var currentIndex = name.count - 1

            Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
                if currentIndex >= 0 {
                    let endIndex = name.index(name.startIndex, offsetBy: currentIndex)
                    displayedName = String(name[..<endIndex])
                    currentIndex -= 1
                } else {
                    timer.invalidate()
                    DispatchQueue.main.asyncAfter(deadline: .now() + letterAnimationDuration) {
                        showText = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            writeName(name: names[1])
                        }
                    }
                }
            }
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
