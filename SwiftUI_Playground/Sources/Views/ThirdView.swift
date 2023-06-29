//
//  ThirdView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/06/30.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct ThirdView: View {
    @EnvironmentObject var navigationModel: NavigationManager // 遷移フラグ

    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width / 10)
            Button {
                navigationModel.path.append(.forthView)
            } label: {
                Text("ForthViewへ")
                    .font(.largeTitle)
                    .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
            .environmentObject(NavigationManager())
    }
}
