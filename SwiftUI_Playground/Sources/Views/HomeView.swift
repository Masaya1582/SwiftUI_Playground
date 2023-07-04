//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ShowMoreView(text: L10n.trumpOne)
                ShowMoreView(text: L10n.trumpTwo)
                ShowMoreView(text: L10n.trumpThree)
            }
        }        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
