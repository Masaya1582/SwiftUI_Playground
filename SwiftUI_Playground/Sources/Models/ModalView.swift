//
//  ModalView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct NonomuraView: View {
    var body: some View {
        Asset.Assets.imgNonomura.swiftUIImage
            .resizable()
            .frame(width: 300, height: 300)
            .scaledToFit()
    }
}

struct SamuragochiView: View {
    var body: some View {
        Asset.Assets.imgSamuragochi.swiftUIImage
            .resizable()
            .frame(width: 300, height: 300)
            .scaledToFit()
    }
}
