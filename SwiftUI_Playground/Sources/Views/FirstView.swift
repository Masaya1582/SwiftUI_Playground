//
//  FirstView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/01.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("FirstViewだよ")
                .font(.largeTitle)
            Image("img_baseball")
                .resizable()
                .frame(width: 100, height: 100)
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
