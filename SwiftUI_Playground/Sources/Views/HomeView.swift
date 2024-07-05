//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var isWarningVisible = true

    var body: some View {
        ZStack {
            Text("🍌")
                .font(.system(size: 200))
                .padding()
                .blur(radius: isWarningVisible ? 10 : 0)
                .onTapGesture {
                    isWarningVisible = true
                }

            if isWarningVisible {
                VStack {
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)
                    Text("Explicit Content")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    Text("This content may not be suitable for all audiences.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                }.onTapGesture {
                    isWarningVisible = false
                }
            }
        }
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
