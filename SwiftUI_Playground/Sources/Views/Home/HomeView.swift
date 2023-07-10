//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
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
            Text("Home View")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presentSideMenu: .constant(false))
    }
}
