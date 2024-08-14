//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var showWarning = false

    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    withAnimation {
                        showWarning = true
                    }
                }) {
                    Text("Show Warning")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            if showWarning {
                WarningView(isVisible: $showWarning)
                    .zIndex(1) // Bring the warning view to the front
            }
        }
        .animation(.spring(), value: showWarning)
    }
}

struct WarningView: View {
    @Binding var isVisible: Bool

    var body: some View {
        VStack {
            Text("⚠️ Warning")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text("This is a warning message.")
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button(action: {
                withAnimation {
                    isVisible = false
                }
            }) {
                Text("Dismiss")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
        .background(Color.red)
        .cornerRadius(20)
        .shadow(radius: 10)
        .frame(maxWidth: 300)
        .transition(.move(edge: .top))
        .opacity(isVisible ? 1 : 0)
    }
}


// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
