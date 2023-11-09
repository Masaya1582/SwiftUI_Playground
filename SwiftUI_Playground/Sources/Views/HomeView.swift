//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var isShowing = false

    var body: some View {
        VStack {
            Button("Toggle Fade") {
                withAnimation {
                    self.isShowing.toggle()
                }
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
            if isShowing {
                Text("Fading In & Out")
                    .modifier(CustomLabel(foregroundColor: .black, size: 20))
                    .transition(.opacity)
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
