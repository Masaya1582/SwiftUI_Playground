//
//  NextView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/23.
//

import SwiftUI

struct NextView: View {
    var body: some View {
        LinearGradient(
            stops: [
                .init(color: .red,
                      location: 0.4),
                .init(color: .white,
                      location: 0.6)
            ],
            startPoint: .bottom,
            endPoint: .top
        )
        .ignoresSafeArea()
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView()
    }
}
