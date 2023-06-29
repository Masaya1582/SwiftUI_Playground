//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var randomNumber = 1 // サイコロ出目の表示用
    @State private var timer: Timer? // タイマー(サイコロ目をランダム表示する用)
    @State private var isRolling = false // サイコロアニメーションを止めるかどうか
    @State private var text = "Let's Play Dice!" // テキストの初期表示 & サイコロの出目を表示

    var body: some View {
        VStack {
            Text(text)
                .padding(.top, 80)
                .font(.system(size: 25))
                .bold()
            Spacer()
            Image(systemName: "die.face.\(randomNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
                .padding()
            Spacer()
            HStack {
                Button {
                    playDice() //サイコロアニメーションスタート
                } label: {
                    Text("サイコロを振る")
                        .padding()
                        .background(.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .bold()
                }
                .disabled(isRolling)
                Button {
                    stopDice()
                } label: {
                    Text("サイコロを止める")
                        .padding()
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .bold()
                }
            }
        }
        .padding()
    }

    /// サイコロの出目を0.1秒毎に変えて表示
    private func playDice() {
        print("サイコロスタート")
        isRolling = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            randomNumber = Int.random(in: 1...6)
        }
    }

    /// サイコロアニメーションを停止、出目をテキスト表示
    private func stopDice() {
        print("サイコロストップ")
        timer?.invalidate()
        timer = nil
        isRolling = false
        text = "サイコロの目は\(randomNumber)です"
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
