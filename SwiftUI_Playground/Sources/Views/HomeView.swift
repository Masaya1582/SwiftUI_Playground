//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var username = ""

    var body: some View {
        TextField("Username", text: $username)
            .submitLabel(.join)
            .padding()
//            .submitLabel(.continue)
//            .submitLabel(.done)
//            .submitLabel(.go)
//            .submitLabel(.join)
//            .submitLabel(.next)
//            .submitLabel(.return)
//            .submitLabel(.route)
//            .submitLabel(.search)
//            .submitLabel(.send)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
