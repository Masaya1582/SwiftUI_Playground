//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var age = 18

    var body: some View {
        VStack(spacing: 20) {
            Stepper("Enter your age", value: $age, in: 0...130)
            Text("Your age is \(age)")
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))

            Stepper("Enter your age(違った書き方)", onIncrement: {
                age += 1
            }, onDecrement: {
                age -= 1
            })
            Text("Your age is \(age)")
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
