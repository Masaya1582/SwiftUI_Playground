//
//  CircularProgressView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/07.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Asset.Colors.mainColor.swiftUIColor.opacity(0.5),
                    lineWidth: 30
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Asset.Colors.mainColor.swiftUIColor,
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)

        }
    }
}
