//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var name: String = ""
    private let president: [String] = ["Joe Biden", "Donald Trump", "George Bush", "Barack Obama", "Thomas Jefferson"]
    private var filterPresidents: [String] {
        // TextField未入力時は全てを表示
        if name.isEmpty {
            return president
        } else {
            // 入力値をFilterして表示するものを指定する
            return president.filter { $0.uppercased().contains(name.uppercased())}
        }
    }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 48) {
                TextField("Search US Presidents", text: $name)
                    .modifier(ClearButton(name: $name))
                    .padding(8)
                    .frame(width: 320, height: 32)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                ForEach(filterPresidents, id: \.self) { president in
                    VStack(alignment: .leading) {
                        Text(president)
                            .padding(.leading, 12)
                        Divider()
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
