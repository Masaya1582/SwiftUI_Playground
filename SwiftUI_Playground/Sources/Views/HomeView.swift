//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var views = [
        TutorialView(image: Asset.Assets.kizaki.image, text: "Kizaki"),
        TutorialView(image: Asset.Assets.nonomura.image, text: "Nonomura"),
        TutorialView(image: Asset.Assets.obokata.image, text: "Obokata"),
        TutorialView(image: Asset.Assets.samuragochi.image, text: "Samuragochi")
    ]

    var body: some View {
        PageView(views)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
