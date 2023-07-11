//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var name = "Jonny"

    var body: some View {
        TextField("Your Name", text: $name)
            .textFieldStyle(.roundedBorder)
            .textCase(.uppercase)
            // .textCase(.lowercase)
            .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
