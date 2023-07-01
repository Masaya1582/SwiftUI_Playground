//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {

    @State private var isShowModalView = false

    var body: some View {
        VStack {
            NavigationView {
                VStack(spacing: 60) {
                    NavigationLink(destination: MyNavigationView().navigationTitle("遷移先だよ")) {
                        Text("Navigation遷移する")
                            .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .orange))
                    }
                    Button {
                        isShowModalView.toggle()
                    } label: {
                        Text("Modal遷移する")
                            .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .green))
                    }
                    .sheet(isPresented: $isShowModalView) {
                        ModalView()
                    }
                }
                .navigationTitle("HomeView")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
