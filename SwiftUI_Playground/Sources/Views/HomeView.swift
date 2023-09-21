//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        Grid(horizontalSpacing: 20, verticalSpacing: 20) {
            GridRow {
                Image(systemName: "xmark")
                Image(systemName: "xmark")
                Image(systemName: "xmark")
            }

            GridRow {
                Image(systemName: "circle")
                Image(systemName: "xmark")
                Image(systemName: "circle")
            }

            GridRow {
                Image(systemName: "xmark")
                Image(systemName: "circle")
                Image(systemName: "circle")
            }
        }
        .font(.largeTitle)
    }
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
