//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("General")) {
                    NavigationLink(destination: AccountView()) {
                        HStack {
                            Image(systemName: "person.circle")
                            Text("Account")
                        }
                    }
                    NavigationLink(destination: NotificationsView()) {
                        HStack {
                            Image(systemName: "bell")
                            Text("Notifications")
                        }
                    }
                }

                Section(header: Text("Preferences")) {
                    NavigationLink(destination: AppearanceView()) {
                        HStack {
                            Image(systemName: "paintbrush")
                            Text("Appearance")
                        }
                    }
                    NavigationLink(destination: PrivacyView()) {
                        HStack {
                            Image(systemName: "lock")
                            Text("Privacy")
                        }
                    }
                }

                Section(header: Text("About")) {
                    NavigationLink(destination: AboutView()) {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("About Us")
                        }
                    }
                    NavigationLink(destination: HelpView()) {
                        HStack {
                            Image(systemName: "questionmark.circle")
                            Text("Help")
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Settings")
        }
    }
}

struct AccountView: View {
    var body: some View {
        Text("Account Settings")
            .navigationBarTitle("Account", displayMode: .inline)
    }
}

struct NotificationsView: View {
    var body: some View {
        Text("Notifications Settings")
            .navigationBarTitle("Notifications", displayMode: .inline)
    }
}

struct AppearanceView: View {
    var body: some View {
        Text("Appearance Settings")
            .navigationBarTitle("Appearance", displayMode: .inline)
    }
}

struct PrivacyView: View {
    var body: some View {
        Text("Privacy Settings")
            .navigationBarTitle("Privacy", displayMode: .inline)
    }
}

struct AboutView: View {
    var body: some View {
        Text("About Us")
            .navigationBarTitle("About Us", displayMode: .inline)
    }
}

struct HelpView: View {
    var body: some View {
        Text("Help")
            .navigationBarTitle("Help", displayMode: .inline)
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
