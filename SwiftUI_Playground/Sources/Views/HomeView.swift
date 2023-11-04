//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var isExpanded = false

    var body: some View {
        VStack {
            Text("Chevron Animation Example")
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
                .padding()

            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(isExpanded ? "Hide Text" : "Show Text")
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
                .font(.headline)
                .foregroundColor(.blue)
            }
            .padding()
            if isExpanded {
                Text("This is the hidden text that you can show or hide using the Chevron button.")
                    .font(.body)
            }
        }
        .padding()
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
