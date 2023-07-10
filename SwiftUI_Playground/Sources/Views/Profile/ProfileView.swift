//
//  ProfileView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/10.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct ProfileView: View {
    @Binding var presentSideMenu: Bool

    var body: some View {
        VStack {
            HStack {
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            Spacer()
            Text("Profile View")
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(presentSideMenu: .constant(false))
    }
}
