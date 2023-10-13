//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isFloatingViewVisible = false

    var body: some View {
        ZStack {
            // Main content of your view
            VStack {
                Spacer()
                Text("Main Content")
                Spacer()
            }

            // Floating View
            if isFloatingViewVisible {
                VStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue)
                        .frame(width: 200, height: 100)
                        .overlay(
                            Text("Floating View")
                                .foregroundColor(.white)
                        )
                        .shadow(radius: 5)
                        .onTapGesture {
                            isFloatingViewVisible.toggle()
                        }
                    Spacer()
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut)
            }

            // Floating Button
            VStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        isFloatingViewVisible.toggle()
                    }
                }) {
                    Image(systemName: isFloatingViewVisible ? "arrow.down.circle" : "arrow.up.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                }
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
