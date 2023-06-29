//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var textFieldInput: String = ""
    @FocusState private var foucusValue: Bool

    var body: some View {
        VStack(spacing: 32) {
            Text("Focus: \(foucusValue == true ? "True" : "False" )")
                .font(.system(size: 24, weight: .bold))

            TextField("Your Texts Here", text: $textFieldInput)
                .focused($foucusValue)
                .textFieldStyle(.roundedBorder)

            Button(action: {
                foucusValue = true
            }, label: {
                Text("Focus on TextField")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 300, height: 60, alignment: .center)
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(12)
            })

            Button(action: {
                foucusValue = false
            }, label: {
                Text("Unfocus TextField")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 300, height: 60, alignment: .center)
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(12)
            })
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
