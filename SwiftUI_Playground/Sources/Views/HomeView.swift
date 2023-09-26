//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isWebViewVisible = false

    var body: some View {
        NavigationView {
            VStack {
                Button {
                    self.isWebViewVisible.toggle()
                } label: {
                    Text("Show WebView")
                }
                .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
                .padding()
                if isWebViewVisible {
                    WebView(url: Binding.constant("https://nauru.or.jp/"))
                        .navigationBarTitle("WebView Example", displayMode: .large)
                }
            }
        }
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
