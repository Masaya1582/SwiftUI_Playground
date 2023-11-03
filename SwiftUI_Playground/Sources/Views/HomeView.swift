//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var isEnabled = false

    var body: some View {
        VStack {
            ForEach(0..<3, id: \.self) { index in
                Button("Press Me") {
                    isEnabled.toggle()
                }
                .modifier(CustomLabel(foregroundColor: .white, size: 28))
                .foregroundStyle(.white)
                .frame(width: 200, height: 200)
                .background(isEnabled ? .green : .yellow)
                .animation(nil, value: isEnabled)
                .clipShape(RoundedRectangle(cornerRadius: isEnabled ? 100 : 0))
                .animation(.default, value: isEnabled)
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
