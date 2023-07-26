//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("animationModeKey") private var animationsMode: AnimationMode = .apple
    @Environment(\.colorScheme) var colorScheme
    private let color = Color.indigo

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(AnimationMode.allCases.indices, id: \.self) { index in
                    let mode = AnimationMode.allCases[index]
                    let makeDivider = index < AnimationMode.allCases.count - 1
                    Button {
                        animationsMode = mode
                    } label: {
                        VStack(spacing: 7) {
                            Image(systemName: mode.imageName)
                                .font(.title2)
                            Text(mode.title)
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .padding(.vertical, 13)
                    }
                    .buttonStyle(BouncyButton())

                    if makeDivider {
                        if !(index == animationsMode.rawValue || (index + 1) == animationsMode.rawValue )  {
                            Divider()
                                .frame(width: 0, height: 55)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 2)
            .background {
                GeometryReader { proxy in
                    let caseCount = AnimationMode.allCases.count
                    color.opacity(0.1)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: proxy.size.width / CGFloat(caseCount))
                    // Offset the background horizontally based on the selected animation mode
                        .offset(x: proxy.size.width / CGFloat(caseCount) * CGFloat(animationsMode.rawValue))
                }
            }
            .padding(12)
            .background {
                Color(.systemBackground)
                    .opacity(0.6)
                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.primary.opacity(colorScheme == .dark ? 0.15 : 0.08), lineWidth: 1.2))
            }
            .padding(.horizontal, 25)
            .transition(.asymmetric(insertion: .opacity.animation(.linear(duration: 0.1).delay(0.15)), removal: .opacity.animation(.linear(duration: 0.1))))
            .animation(.smooth, value: animationsMode)
        }
    }
}

extension Animation {
    static var smooth: Animation {
        Animation.linear(duration: 0.3)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
