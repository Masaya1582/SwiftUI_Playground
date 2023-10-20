//
//  SDImageView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/10/20.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDImageView: View {
    let imageUrl: String

    var body: some View {
        WebImage(url: URL(string: imageUrl))
            .resizable()
            .placeholder {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFit()
    }
}

struct SDImageView_Previews: PreviewProvider {
    static var previews: some View {
        SDImageView(imageUrl: "https://masasophi.com/wp-content/uploads/2023/05/normal_swift.001.png")
    }
}
