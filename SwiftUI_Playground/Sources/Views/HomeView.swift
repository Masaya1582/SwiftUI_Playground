//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var half = false

    var body: some View {
        Image("img_dio")
            .resizable()
            .scaledToFill()
            .scaleEffect(half ? 0.1 : 0.5) 
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.half.toggle()
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
