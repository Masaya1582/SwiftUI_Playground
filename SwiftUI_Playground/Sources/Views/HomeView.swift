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
            FirstView()
                .tabItem {
                    // タブの画像
                    Image(systemName: "face.smiling")
                    // タブ下のテキスト
                    Text("First")
                }
            SecondView()
                .tabItem {
                    Image(systemName: "play.rectangle.fill")
                    Text("Second")
                }
            ThirdView()
                .tabItem {
                    Image(systemName: "mic.slash.fill")
                    Text("Third")
                }
            ForthView()
                .tabItem {
                    Image(systemName: "sunrise.fill")
                    Text("Forth")
                }
            FifthView()
                .tabItem {
                    Image(systemName: "bolt.circle.fill")
                    Text("Fifth")
                }
        }
        // タブのカラーを指定
        .accentColor(.orange)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
