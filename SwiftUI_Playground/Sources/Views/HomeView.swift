//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var activeID: Int?
    var body: some View {
        VStack {
            Spacer()
            GeometryReader {
                let size = $0.size
                let padding = (size.width - 70) / 2

                /// Circular Slider
                ScrollView(.horizontal) {
                    HStack(spacing: 35) {
                        ForEach(1...8, id: \.self) { index in
                            Image("img_dio")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .clipShape(.circle)
                            /// Shadow
                                .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
                                .visualEffect { view, proxy in
                                    view
                                        .offset(y: offset(proxy))
                                    /// Option - 2:2
                                        .scaleEffect(1 + ((scale(proxy) / 2)))
                                    /// Option - 1:2
                                        .offset(y: scale(proxy) * 15)
                                }
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view
                                    /// Option - 1:1 (For More Check out the Video!)
                                    //.offset(y: phase.isIdentity && activeID == index ? 15 : 0)
                                    /// Option - 2:1
                                    //.scaleEffect(phase.isIdentity && activeID == index && pickerType == .scaled ? 1.5 : 1, anchor: .bottom)
                                }
                        }
                    }
                    .frame(height: size.height)
                    .offset(y: -30)
                    .scrollTargetLayout()
                }
                .safeAreaPadding(.horizontal, padding)
                .scrollIndicators(.hidden)
                /// Snapping
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $activeID)
                .frame(height: size.height)
            }
            .frame(height: 200)
        }
        .ignoresSafeArea(.container, edges: .bottom)
    }

    /// Circular Slider View Offset
    func offset(_ proxy: GeometryProxy) -> CGFloat {
        let progress = progress(proxy)
        /// Simply Moving View Up/Down Based on Progress
        return progress < 0 ? progress * -30 : progress * 30
    }

    func scale(_ proxy: GeometryProxy) -> CGFloat {
        let progress = min(max(progress(proxy), -1), 1)

        return progress < 0 ? 1 + progress : 1 - progress
    }

    func progress(_ proxy: GeometryProxy) -> CGFloat {
        /// View Width
        let viewWidth = proxy.size.width
        let minX = (proxy.bounds(of: .scrollView)?.minX ?? 0)
        return minX / viewWidth
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
