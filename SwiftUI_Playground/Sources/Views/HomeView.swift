//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var dragAmount = CGSize.zero

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                VStack(spacing: 20) {
                    Text("1234 5678 9101 1121")
                        .font(.title)
                        .foregroundColor(.white)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Card Holder")
                                .font(.caption)
                                .foregroundColor(.white)
                            Text("John Doe")
                                .foregroundColor(.white)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Expires")
                                .font(.caption)
                                .foregroundColor(.white)
                            Text("12/24")
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
            }
            .frame(width: 300, height: 200)
            .cornerRadius(15)
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            self.dragAmount = .zero
                        }
                    }
            )
            Spacer()
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
