//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var sportsArray: [String] = ["Baseball", "Soccer", "Tennis", "Basketball"]

    var body: some View {
        Text("Check Console for outputs")
            .onAppear {
                returnArray(of: sportsArray)
            }
    }

    private func returnArray(of array: [String]) -> [String] {
        print(array)
        return array
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
