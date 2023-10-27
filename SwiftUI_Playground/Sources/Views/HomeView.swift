//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var count = 0
    @State private var isShowAho = false

    var body: some View {
        VStack {
            Spacer()
            Text(String(count))
                .modifier(CustomLabel(foregroundColor: .black, size: 32))
            if isShowAho {
                Asset.Assets.nabeatsu.swiftUIImage
                    .resizable()
                    .modifier(CustomImage(width: 280, height: 280))
            }
            Spacer()
            Button("Increment") {
                incrementCount()
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
        }
    }

    private func incrementCount() {
        count += 1
        if count.isMultiple(of: 3) || String(count).contains("3") {
            isShowAho = true
        } else {
            isShowAho = false
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
