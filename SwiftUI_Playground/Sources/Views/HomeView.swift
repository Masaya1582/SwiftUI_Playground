//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var userName = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            TextField("Username", text: $userName)
                .focused($isFocused)
                .modifier(CustomTextField(disableAutoCorrection: false))
            
            Button {
                isFocused = false
            } label: {
                Text("Sign in")
                    .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
