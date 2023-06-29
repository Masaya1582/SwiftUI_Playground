//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    let dismissAction: (() -> Void)
    @State private var showWebView = false
    private let url = URL(string: "http://abehiroshi.la.coocan.jp/")

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: SafariView(url: url!, onDismiss: { showWebView = false })
                        .navigationBarHidden(true)
                        .ignoresSafeArea(),
                    isActive: $showWebView
                ) {
                    Button(action: {
                        showWebView = true
                    }, label: {
                        Text("Show WebView")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                    })
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            dismissAction: {}
        )
    }
}
