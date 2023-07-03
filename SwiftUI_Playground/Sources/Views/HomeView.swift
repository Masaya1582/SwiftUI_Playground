//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State var president: [President] = [
        President(id: 1, name: "Joe Biden"),
        President(id: 2, name: "Donald Trump"),
        President(id: 3, name: "Barack Obama"),
        President(id: 4, name: "George W. Bush"),
        President(id: 5, name: "Bill Clinton"),
        President(id: 6, name: "George H. W. Bush"),
        President(id: 7, name: "Ronald Reagan"),
        President(id: 8, name: "Jimmy Carter"),
        President(id: 9, name: "Gerald Ford"),
        President(id: 10, name: "Richard Nixon")
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(president.indices, id: \.self) { index in
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 24)
                            Text("\(president[index].id)")
                                .foregroundColor(.white)
                        }
                        Text(president[index].name)
                    }
                }
                .onMove { (indexSet, index) in
                    self.president.move(fromOffsets: indexSet, toOffset: index)
                    for (index, _) in self.president.enumerated() {
                        self.president[index].id = index + 1
                    }
                }
            }
            .navigationBarTitle(Text("US Presidents"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
