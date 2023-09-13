//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isExpanded = false

    var body: some View {
        VStack {
            DisclosureGroup("Expandable Group", isExpanded: $isExpanded) {
                Text("This is some content inside the group.")
            }
            .padding()

            Spacer()

            Text("Group is \(isExpanded ? "expanded" : "collapsed").")
                .font(.headline)
                .padding()
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
