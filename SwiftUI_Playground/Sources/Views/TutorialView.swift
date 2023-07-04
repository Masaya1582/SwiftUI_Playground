//
//  TutorialView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/04.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct TutorialView: View {
    let image: UIImage
    let text: String
    var body: some View {
        ZStack {
            Asset.Colors.backgroundColor.swiftUIColor
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Spacer()
                Text(text)
                    .font(.custom(FontFamily.Caprasimo.regular, size: 32))
                    .foregroundColor(.black)
                Image(uiImage: image)
                    .resizable()
                // .scaledToFit()
                    .frame(width: 240, height: 240)
                Spacer()
            }
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(image: Asset.Assets.kizaki.image, text: "This is Kizaki!")
    }
}
