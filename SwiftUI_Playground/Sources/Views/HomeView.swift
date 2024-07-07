//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var toggleOn = false

    var body: some View {
        ZStack {
            Color(toggleOn ? #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1) : #colorLiteral(red: 0.2235294118, green: 0.2392156863, blue: 0.2784313725, alpha: 1))
            VStack {
                ZStack {
                    Image("illustrationLight")
                        .opacity(toggleOn ? 1 : 0)
                        .rotation3DEffect(
                            .degrees(toggleOn ? 0 : -180),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                    Image("illustrationDark")
                        .opacity(toggleOn ? 0 : 1)
                        .rotation3DEffect(
                            .degrees(toggleOn ? 180 : 0),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                }.padding(24)

                ZStack {
                    Capsule()
                        .frame(width: 80, height: 44)
                        .foregroundColor(Color(toggleOn ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1028798084) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6039008336)))
                    ZStack {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        Image(systemName: toggleOn ? "sun.max.fill" : "moon.fill")
                    }
                    .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
                    .offset(x: toggleOn ? 18 : -18)
                    .padding(24)
                    .animation(.spring())
                }
                .onTapGesture {
                    self.toggleOn.toggle()
                }
                Spacer().frame(height: 120)
            }
        }
        .ignoresSafeArea(.all)
        .animation(.default)
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
