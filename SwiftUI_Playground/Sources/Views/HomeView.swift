//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 40) {
            Button {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            } label: {
                Text("Light Touch")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 42))
            }
            Button {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            } label: {
                Text("Midium Touch")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 42))
            }
            Button {
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
            } label: {
                Text("Heavy Touch")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 42))
            }
            Button {
                let generator = UIImpactFeedbackGenerator(style: .soft)
                generator.impactOccurred()
            } label: {
                Text("Soft Touch")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 42))
            }
            Button {
                let generator = UIImpactFeedbackGenerator(style: .rigid)
                generator.impactOccurred()
            } label: {
                Text("Rigid Touch")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 42))
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
