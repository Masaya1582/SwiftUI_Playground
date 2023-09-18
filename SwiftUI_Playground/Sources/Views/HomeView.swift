//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View { VStack {
        CardView {
            Text("Snorlax")
        }

        CardView {
            Image("img_dio")
                .resizable()
                .frame(width: 60, height: 60)
        }

        CardView(color: Color.red.opacity(0.4)) {
            Text("RedShadow")
        }

        CardView(
            color: Color.green.opacity(0.4),
            radius: 24) {
                Text("BigShadow")
            }
    }}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
