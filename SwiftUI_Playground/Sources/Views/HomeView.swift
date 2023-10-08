//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Pulsating Circle")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
                .padding(.top, 50)
            PulsatingCircleView()
                .padding()
            PulsatingCircleView()
                .padding()
            PulsatingCircleView()
                .padding()
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
