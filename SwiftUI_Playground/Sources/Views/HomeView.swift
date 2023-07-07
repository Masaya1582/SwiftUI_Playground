//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var unreadNotifications: Int = 0

    // 99以上の場合と0の時を考慮
    var badgeValue: String? {
        if unreadNotifications > 99 {
            return "99+"
        } else if unreadNotifications == 0 {
            return nil
        } else {
            return unreadNotifications.description
        }
    }

    var body: some View {
        TabView {
            Group {
                Text("Home")
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                Text("Search")
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .badge("99+")
                Text("Notification")
                    .tabItem {
                        Label("Notification", systemImage: "bell")
                    }
                    .badge(badgeValue)
                Text("Settings")
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
                    .badge("New")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
