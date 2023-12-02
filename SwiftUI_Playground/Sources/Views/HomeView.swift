//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.blue)
                        Text("Account")
                    }
                    HStack {
                        Image(systemName: "bell.fill")
                            .foregroundColor(.orange)
                        Text("Notifications")
                    }
                }

                Section(header: Text("Privacy")) {
                    HStack {
                        Image(systemName: "hand.raised.fill")
                            .foregroundColor(.purple)
                        Text("Privacy Settings")
                    }
                }

                Section(header: Text("About")) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.green)
                        Text("About Us")
                    }
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("Rate Us")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
