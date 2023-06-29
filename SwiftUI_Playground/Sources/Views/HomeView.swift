//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var homeViewModel = HomeViewModel()

    var body: some View {
        VStack(spacing: 20) {
            ForEach(0..<homeViewModel.toastArray.count, id: \.self) { index in
                Button {
                    homeViewModel.toast = homeViewModel.toastArray[index]
                } label: {
                    Text("\(homeViewModel.toastTitleArray[index])")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(width: 300, height: 80)
                .background(homeViewModel.toastColorArray[index])
                .cornerRadius(16)
            }
        }
        .toastView(toast: $homeViewModel.toast)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
