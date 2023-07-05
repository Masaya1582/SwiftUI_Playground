//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var pokemon = PokemonType(name: "ピカチュウ", type: "カミナリ", level: 50) // インスタンス化

    var body: some View {
        VStack {
            Text("名前: \(pokemon.name)")
                .font(.largeTitle)
                .padding()
            Text("タイプ: \(pokemon.type)")
                .font(.largeTitle)
                .padding()
            Text("レベル: \(pokemon.level)")
                .font(.largeTitle)
                .padding()
            Button { // ボタンを押したらポッチャマの情報に変更する
                pokemon.name = "ポッチャマ"
                pokemon.type = "みず"
                pokemon.level = 99
            } label: {
                Text("ポッチャマに変更")
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width / 1.2)
            .font(.largeTitle)
            .foregroundColor(Color.white)
            .background(.orange)
            .cornerRadius(18)
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
