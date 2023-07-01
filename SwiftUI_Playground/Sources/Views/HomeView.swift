//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var circleManager = CircleManager()

    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Text("Signal: \(circleManager.titleText)")
                        .font(.largeTitle)
                    Circle()
                        .frame(width: UIScreen.main.bounds.width / 10)
                        .foregroundColor(circleManager.selectedSignalColor)
                }
                HStack { // 信号を横並びにする
                    ForEach(circleManager.signals) { signal in
                        Circle()
                            .foregroundColor(signal.color)
                            .padding()
                            .onTapGesture { // 信号をタップしたとき
                                circleManager.selectedIndex = signal.index
                                circleManager.showSelectedSignal()
                            }
                    }
                }
                .border(Color.black, width: 3.0)
                Spacer()
                Image(systemName: "car")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 1.5)
                Spacer()
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
