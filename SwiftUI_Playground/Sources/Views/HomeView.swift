//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ImageListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }

            ImageUploadView()
                .tabItem {
                    Image(systemName: "square.and.arrow.up")
                    Text("Upload")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
