//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {

    var body: some View {
        VStack {
            Text("Hello World")
        }
        .onAppear {
            let names = ["Alice", "Bob", "John"]
            let shortNames = names.filter { name in
                if name.count < 4 {
                    // 1
                    return true
                } else {
                    // 2
                    return false
                }
            }
            print("Name: \(shortNames)")
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
