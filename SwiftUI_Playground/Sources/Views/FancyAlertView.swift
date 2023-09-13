//
//  FancyAlertView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/09/10.
//

import SwiftUI

struct FancyAlertView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Fancy Alert")
                    .font(.title)
                    .foregroundColor(.white)
                
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
                
                Text("This is a fancy alert with SwiftUI.")
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    isShowing = false
                }) {
                    Text("Dismiss")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.black)
            .cornerRadius(20)
        }
    }
}
