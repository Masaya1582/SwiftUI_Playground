//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Account Settings").modifier(CustomLabel(foregroundColor: .blue, size: 24))) {
                    VintageSettingView(iconName: "person.fill", title: "Profile")
                    VintageSettingView(iconName: "envelope.fill", title: "Email")
                    VintageSettingView(iconName: "lock.fill", title: "Password")
                }
                Section(header: Text("App Settings").modifier(CustomLabel(foregroundColor: .green, size: 24))) {
                    VintageSettingView(iconName: "gear", title: "General")
                    VintageSettingView(iconName: "bell.fill", title: "Notifications")
                    VintageSettingView(iconName: "arrow.up.arrow.down.circle.fill", title: "Data Usage")
                }
            }
            .navigationBarTitle("Settings")
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
