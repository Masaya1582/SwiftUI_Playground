//
//  ContentView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2024/09/12.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            PostView(selectedTab: $selectedTab)
                .tabItem {
                    Label("Post", systemImage: "plus")
                }
                .tag(1)
        }
    }
}
