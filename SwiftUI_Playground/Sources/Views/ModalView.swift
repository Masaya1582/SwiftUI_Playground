//
//  ModalView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/01.
//

import SwiftUI

struct ModalView: View {
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            Text("This is Modal遷移")
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
