//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @Binding var presentSideMenu: Bool

    var body: some View {
        TabItemView(presentSideMenu: $presentSideMenu, title: "Home")
            .padding(.horizontal, 24)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presentSideMenu: .constant(false))
    }
}
