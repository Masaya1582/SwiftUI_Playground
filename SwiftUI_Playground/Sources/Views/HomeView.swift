//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var isMenuVisible = false

    var body: some View {
        VStack {
            if isMenuVisible {
                MenuContent()
                    .transition(.move(edge: .top))
            }
            Spacer()
            Button("Show Image") {
                withAnimation {
                    self.isMenuVisible.toggle()
                }
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))

        }
        .padding()
    }
}

struct MenuContent: View {
    var body: some View {
        VStack {
            Asset.Assets.imgDio.swiftUIImage
                .resizable()
                .modifier(CustomImage(width: 300, height: 300))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding(.top, 10)
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
