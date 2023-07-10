//
//  MainTabView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/10.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct MainTabView: View {
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0

    var body: some View {
        ZStack {
            TabView(selection: $selectedSideMenuTab) {
                HomeView(presentSideMenu: $presentSideMenu)
                    .tag(0)
                PostView(presentSideMenu: $presentSideMenu)
                    .tag(1)
                NewsView(presentSideMenu: $presentSideMenu)
                    .tag(2)
                SettingView(presentSideMenu: $presentSideMenu)
                    .tag(3)
            }
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
