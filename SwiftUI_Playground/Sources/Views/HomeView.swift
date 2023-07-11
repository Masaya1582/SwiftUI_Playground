//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List(1..<100) { row in
                Text("Row \(row)")
            }
            .refreshable {
                // リフレッシュ時に処理したいこと
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
