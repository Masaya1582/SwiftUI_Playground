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
            List {
                Section {
                    Text("iPhone Language")
                }
                Section {
                    Text("English")
                    Text("Thai")
                } header: {
                    Text("Preferred language order")
                    // Fontをつけたい場合
                    // .font(.custom(FontFamily.Caprasimo.regular, size: 16))
                } footer: {
                    Text("Apps and websites will use the first language in this list that they support.")
                }
                // ヘッダーを大きくしたい場合
                // .headerProminence(.increased)
                Section {
                    Text("Region")
                    Text("Calendar")
                    Text("Temperature Unit")
                }
            }
            .listStyle(.sidebar) // .plain, .inset, .grouped, .insetGrouped, .sidebarの5種類
            .navigationTitle("Language & Region")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
