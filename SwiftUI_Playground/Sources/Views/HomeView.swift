//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var showBreatheView: Bool = false
    @State private var startAnimation: Bool = false
    @State private var breatheAction: String = "Breathe In"

    let gradient = LinearGradient(colors: [Color.purple.opacity(0.5), Color.blue.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)

    var body: some View {
        ZStack {
            content()
        }
        .onReceive(Timer.publish(every: 4, on: .main, in: .common).autoconnect()) { _ in
            if showBreatheView {
                breatheAction = (breatheAction == "Breathe Out" ? "Breathe In" : "Breathe Out")
                withAnimation(.easeInOut(duration: 4).delay(0.1)) {
                    startAnimation.toggle()
                }
                UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
            }
        }
    }

    private func content() -> some View {
        VStack {
            GeometryReader { proxy in
                let size = proxy.size

                VStack {
                    Spacer()

                    breatheView(size: size)

                    Spacer()

                    Button(action: startBreathing) {
                        Text(showBreatheView ? "Finish Breathing" : "START")
                            .fontWeight(.semibold)
                            .foregroundColor(showBreatheView ? .black : .white)
                            .padding(.vertical, 15)
                            .frame(maxWidth: .infinity)
                            .background {
                                if showBreatheView {
                                } else {
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .fill(gradient)
                                }
                            }
                    }
                    .padding()
                    .opacity(showBreatheView ? 1 : 1)
                    .animation(.easeInOut(duration: 0.3), value: showBreatheView)
                }
                .frame(width: size.width, height: size.height, alignment: .bottom)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }

    private func breatheView(size: CGSize) -> some View {
        ZStack {
            ForEach(1...8, id: \.self) { index in
                Circle()
                    .fill(gradient)
                    .frame(width: 150, height: 150)
                    .offset(x: startAnimation ? 0 : 75)
                    .rotationEffect(.init(degrees: Double(index) * 45))
                    .rotationEffect(.init(degrees: startAnimation ? -45 : 0))
            }
            .scaleEffect(startAnimation ? 0.8 : 1)

            Text("Breathe In")
                .font(.system(size: 30))
                .foregroundColor(.black)
                .padding()
                .opacity(breatheAction == "Breathe In" && showBreatheView ? 1 : 0)
                .animation(.easeInOut(duration: 1), value: breatheAction)

            Text("Breathe Out")
                .font(.system(size: 30))
                .foregroundColor(.black)
                .padding()
                .opacity(breatheAction == "Breathe Out" && showBreatheView ? 1 : 0)
                .animation(.easeInOut(duration: 1), value: breatheAction)
        }
    }

    private func startBreathing() {
        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
            showBreatheView.toggle()
        }

        if showBreatheView {
            withAnimation(.easeInOut(duration: 4).delay(0.05)) {
                startAnimation = true
            }
        } else {
            withAnimation(.easeInOut(duration: 1.5)) {
                startAnimation = false
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
