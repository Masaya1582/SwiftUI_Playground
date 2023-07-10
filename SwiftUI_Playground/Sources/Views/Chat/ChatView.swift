//
//  ChatView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/10.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct ChatView: View {
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        TabItemView(presentSideMenu: $presentSideMenu, title: "Chat")
            .padding(.horizontal, 24)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(presentSideMenu: .constant(false))
    }
}
