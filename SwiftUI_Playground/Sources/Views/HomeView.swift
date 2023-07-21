//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var defaultViewModel = DefaultViewModel()

    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Detail") {
                    DetailView()
                        .toolbarRole(.editor)
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
