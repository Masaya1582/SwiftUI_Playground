//
//  NewsView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/10.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct NewsView: View {
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        TabItemView(presentSideMenu: $presentSideMenu, title: "News")
            .padding(.horizontal, 24)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(presentSideMenu: .constant(false))
    }
}
