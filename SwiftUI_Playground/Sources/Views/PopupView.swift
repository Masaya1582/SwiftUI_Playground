//
//  PopupView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/28.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct PopupView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
            VStack {
                Text("Login Successful!")
                    .font(.title)
                    .padding()

                Button(action: {
                    // Code to dismiss the popup if needed
                }) {
                    Text("Close")
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding()
        }
    }
}
