//
//  SecondView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/06/30.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var navigationModel: NavigationManager // 遷移フラグ

    var body: some View {
        VStack {
            Image(systemName: "baseball")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width / 10)
            Button {
                navigationModel.path.append(.thirdView)
            } label: {
                Text("ThirdViewへ")
                    .font(.largeTitle)
                    .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
            .environmentObject(NavigationManager())
    }
}
