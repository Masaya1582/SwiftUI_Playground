//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isPresented = false

    var body: some View {
        Button {
            isPresented = true
        } label: {
            Text("Show Modal")
                .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: Asset.Colors.backgroundColor.swiftUIColor))
        }
        .sheet(isPresented: $isPresented) {
            NextView()
                .interactiveDismissDisabled()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
