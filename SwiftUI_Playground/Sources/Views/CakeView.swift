//
//  CakeView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/25.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct CakeView: View {
    @StateObject private var chefSwift = ChefSwift()

    var body: some View {
        VStack {
            if chefSwift.isBaking {
                Text("Chef Combine is baking a cake...")
            } else if let cake = chefSwift.cake {
                Text("Yay! The cake is ready! 🎉")
                    .font(.headline)
                Text("It's a delicious \(cake.flavor) cake!")
                    .padding()
            } else if let error = chefSwift.error {
                Text("Oops! There was a problem baking the cake:")
                Text(error)
                    .foregroundColor(.red)
            } else {
                Text("Tap the button to start baking a cake!")
            }
            Button {
                chefSwift.startBaking()
            } label: {
                Text("Start Baking")
            }
            .padding()
            .disabled(chefSwift.isBaking)
        }
    }
}

struct CakeView_Previews: PreviewProvider {
    static var previews: some View {
        CakeView()
    }
}
