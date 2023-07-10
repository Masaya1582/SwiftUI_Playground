//
//  SettingView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/10.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct SettingView: View {
    @Binding var presentSideMenu: Bool

    var body: some View {
        TabItemView(presentSideMenu: $presentSideMenu, title: "Setting")
        .padding(.horizontal, 24)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(presentSideMenu: .constant(false))
    }
}
