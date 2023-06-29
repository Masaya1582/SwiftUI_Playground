//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigationModel: NavigationManager // 遷移フラグ

    var body: some View {
        NavigationStack(path: $navigationModel.path) {
            VStack {
                Image(systemName: "car")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 10)
                Button {
                    navigationModel.path.append(.secondView)
                } label: {
                    Text("スタート")
                        .font(.largeTitle)
                        .padding()
                }
            }
            .navigationDestination(for: ShowView.self) { showView in
                switch showView {
                case .secondView:
                    SecondView()
                case .thirdView:
                    ThirdView()
                case .forthView:
                    ForthView()
                case .fifthView:
                    FifthView()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(NavigationManager())
    }
}
