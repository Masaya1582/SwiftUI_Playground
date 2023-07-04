//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var name: String = ""
    @State private var onEditing: Bool = false

    var body: some View {
        ZStack {
            Asset.Colors.backgroundColor.swiftUIColor
                .ignoresSafeArea()
            VStack {
                Text(onEditing ? "On Editing" : "Not On Editing")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 20))
                TextField("Your Name", text: $name, onEditingChanged: { onEditing in
                    print("onEditingChanged: \(onEditing)")
                    self.onEditing = onEditing
                }, onCommit: {
                    print("onCommit")
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
