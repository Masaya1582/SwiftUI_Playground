//
//  FifthView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/06/30.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct FifthView: View {
    @EnvironmentObject var navigationModel: NavigationManager

    var body: some View {
        VStack {
            Image(systemName: "bag")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width / 10)
            Button {
                navigationModel.path.removeAll()
            } label: {
                Text("トップに戻る")
                    .font(.largeTitle)
                    .padding()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct FifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView()
    }
}
