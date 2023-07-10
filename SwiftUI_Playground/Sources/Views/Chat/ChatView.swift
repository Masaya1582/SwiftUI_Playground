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
            Text("Chat View")
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(presentSideMenu: .constant(false))
    }
}
