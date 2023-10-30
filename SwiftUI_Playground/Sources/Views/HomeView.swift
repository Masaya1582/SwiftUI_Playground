//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var progress: Double = 0.1

    var body: some View {
        VStack {
            CustomProgressView(progress: progress)
                .frame(height: 20)
                .padding()

            Button("Increase Progress") {
                withAnimation {
                    self.progress += 0.1
                }
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        }
    }
}

struct CustomProgressView: View {
    var progress: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 10)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                Rectangle()
                    .frame(width: min(CGFloat(self.progress) * geometry.size.width, geometry.size.width), height: 10)
                    .foregroundColor(Color.blue)
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
