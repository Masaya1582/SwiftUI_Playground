//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var status: String = "Active"
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        Text("Status: \(status)")
            .font(.custom(FontFamily.Caprasimo.regular, size: 40))
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .inactive {
                    status = "Inactive"
                    print("Inactive")
                } else if newPhase == .active {
                    status = "Active"
                    print("Active")
                } else if newPhase == .background {
                    status = "Background"
                    print("Background")
                }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
