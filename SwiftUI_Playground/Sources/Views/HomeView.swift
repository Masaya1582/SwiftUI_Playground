//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var activeTabIndex = 1

    var body: some View {
        TabView(selection: $activeTabIndex) {
            Tab1()
                .tabItem {
                    Image(systemName: "square.and.arrow.up")
                    Text("TabA")
                }
                .tag(1)
            Tab2()
                .tabItem {
                    Image(systemName: "pencil.circle")
                    Text("TabB")
                }
                .tag(2)
        }
        .onChange(of: activeTabIndex) { selection in
            switch selection {
            case 1:
                print("TabA Tapped")
            case 2:
                print("TabB Tapped")
            default:
                break
            }
        }
    }
}

struct Tab1: View {
    var body: some View {
        Text("HomeView")
    }
}
struct Tab2: View {
    var body: some View {
        Text("NewsListView")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
