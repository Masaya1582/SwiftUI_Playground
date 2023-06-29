//
//  ForthView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/06/30.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct ForthView: View {
    @EnvironmentObject var navigationModel: NavigationManager // 遷移フラグ

    var body: some View {
        VStack {
            Image(systemName: "note")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width / 10)
            Button {
                navigationModel.path.append(.fifthView)
            } label: {
                Text("FifthViewへ")
                    .font(.largeTitle)
                    .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ForthView_Previews: PreviewProvider {
    static var previews: some View {
        ForthView()
            .environmentObject(NavigationManager())
    }
}
