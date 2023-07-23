//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var showNextView = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.orange, .yellow, .red],
                startPoint: .bottomTrailing,
                endPoint: .topLeading
            )
            .ignoresSafeArea()
            .opacity(0.8)
            VStack {
                Text("Awesome UI!")
                    .font(.largeTitle)
                    .kerning(10)
                    .padding()
                Button {
                    showNextView.toggle()
                } label: {
                    Text("To NextView")
                        .font(.largeTitle)
                }
            }
        }
        .sheet(isPresented: $showNextView) {
            NextView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
