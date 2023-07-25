//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("isDarkModeOn") var isDarkModeOn: Bool = false

    var body: some View {
        VStack {
            Toggle("Dark Mode", isOn: $isDarkModeOn)
                .padding()
                .foregroundColor(isDarkModeOn ? .white : .black)
                .background(isDarkModeOn ? Color.black : Color.white)
                .cornerRadius(10)
                .padding()

            Text(isDarkModeOn ? "Dark Mode is On" : "Dark Mode is Off")
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
                .foregroundColor(isDarkModeOn ? .white : .black)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isDarkModeOn ? Color.black : Color.white)
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
