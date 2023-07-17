//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var orientation = UIDeviceOrientation.unknown

    var body: some View {
        Group {
            if orientation.isPortrait {
                Text("Portrait")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            } else if orientation.isLandscape {
                Text("Landscape")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            } else if orientation.isFlat {
                Text("Flat")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            } else {
                Text("Unknown")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
