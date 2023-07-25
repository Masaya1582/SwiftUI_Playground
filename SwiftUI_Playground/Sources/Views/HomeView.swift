//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        VStack(spacing: 40) {
            // show just the date
            Text(Date.now.addingTimeInterval(600), style: .date)
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))

            // show just the time
            Text(Date.now.addingTimeInterval(600), style: .time)
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))

            // show the relative distance from now, automatically updating
            Text(Date.now.addingTimeInterval(600), style: .relative)
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))

            // make a timer style, automatically updating
            Text(Date.now.addingTimeInterval(600), style: .timer)
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
