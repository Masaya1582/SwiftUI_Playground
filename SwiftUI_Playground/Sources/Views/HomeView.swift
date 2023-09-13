//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var buttonEnable: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            Toggle(isOn: $buttonEnable) {
                Text("ButtonEnable: \(buttonEnable.description)")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 16))
            }
            Button {
                print("Button Tapped")
            } label: {
                Text("Tap Me!!(\(buttonEnable ? "Enable" : "Disable"))")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(buttonEnable ? Color.orange : Color(UIColor.lightGray))
            }
            .disabled(!buttonEnable)
        }.padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
