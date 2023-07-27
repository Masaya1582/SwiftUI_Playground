//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var themeSettings: ThemeSettings

    var body: some View {
        VStack {
            Text("Color Theme Changer App")
                .font(.title)
                .padding()

            Rectangle()
                .foregroundColor(themeSettings.themeColor)
                .frame(width: 200, height: 200)
                .padding()

            ThemeListView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
