//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import QGrid

struct HomeView: View {
    private let predident = [
        President(firstName: "Joe", lastName: "Biden", image: Asset.Assets.imgBiden.swiftUIImage),
        President(firstName: "Donald", lastName: "Trump", image: Asset.Assets.imgDonald.swiftUIImage),
        President(firstName: "Barack", lastName: "Obama", image: Asset.Assets.imgBarack.swiftUIImage),
        President(firstName: "George.W", lastName: "Bush", image: Asset.Assets.imgGeorgeW.swiftUIImage),
        President(firstName: "Bill", lastName: "Clinton", image: Asset.Assets.imgBill.swiftUIImage),
        President(firstName: "George.H.W", lastName: "Bush", image: Asset.Assets.imgGeorgeHw.swiftUIImage),
        President(firstName: "Ronald", lastName: "Reagan", image: Asset.Assets.imgRonald.swiftUIImage),
        President(firstName: "Jimmy", lastName: "Carter", image: Asset.Assets.imgJimmy.swiftUIImage),
        President(firstName: "Gerald", lastName: "Ford", image: Asset.Assets.imgGerald.swiftUIImage)
    ]

    var body: some View {
        QGrid(self.predident, columns: 3) { GridCell(president: $0) }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
