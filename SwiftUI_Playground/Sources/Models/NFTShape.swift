//
//  NFTShape.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct NFTShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            // 1
            // let width: CGFloat = 200
            // let height: CGFloat = 200
            let width: CGFloat = rect.width
            let height: CGFloat = rect.height

            path.move(
                to: CGPoint(
                    x: 0.2 * width,
                    y: 0 * height
                )
            )

            path.addLine(
                to: CGPoint(
                    x: 0.8 * width,
                    y: 0 * height)
            )

            path.addLine(
                to: CGPoint(
                    x: 1 * width,
                    y: 0.5 * height)
            )

            path.addLine(
                to: CGPoint(
                    x: 0.8 * width,
                    y: 1 * height)
            )

            path.addLine(
                to: CGPoint(
                    x: 0.2 * width,
                    y: 1 * height)
            )

            path.addLine(
                to: CGPoint(
                    x: 0 * width,
                    y: 0.5 * height)
            )

            path.closeSubpath()
        }
    }
}
