//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        VStack {
            Text("Dio")
                .font(.custom(FontFamily.Caprasimo.regular, size: 42))
            Asset.Assets.imgDio.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                )
                .contextMenu {
                    Button(action: {
                        print("fight")
                    }) {
                        Text("FIGHT")
                        Image(systemName: "figure.wave")
                    }

                    Button(action: {
                        print("bag")
                    }) {
                        Text("BAG")
                        Image(systemName: "bag")
                    }

                    Button(action: {
                        print("pokemon")
                    }) {
                        Text("POKEMON")
                        Image(systemName: "hare")
                    }

                    Button(action: {
                        print("run")
                    }) {
                        Text("RUN")
                        Image(systemName: "figure.walk")
                    }
                }
            Spacer().frame(height: 100)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
