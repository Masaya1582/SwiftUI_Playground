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
        President(firstName: "Joe", lastName: "Biden", imageName: "img_biden"),
        President(firstName: "Donald", lastName: "Trump", imageName: "img_donald"),
        President(firstName: "Barack", lastName: "Obama", imageName: "img_barack"),
        President(firstName: "George.W", lastName: "Bush", imageName: "img_george_w"),
        President(firstName: "Bill", lastName: "Clinton", imageName: "img_bill"),
        President(firstName: "George.H.W", lastName: "Bush", imageName: "img_george_hw"),
        President(firstName: "Ronald", lastName: "Reagan", imageName: "img_ronald"),
        President(firstName: "Jimmy", lastName: "Carter", imageName: "img_jimmy"),
        President(firstName: "Gerald", lastName: "Ford", imageName: "img_gerald")
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
