//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    let columns: [String]
    let data: [[String]]

    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                HStack(spacing: 0) {
                    ForEach(columns, id: \.self) { column in
                        Text(column)
                            .frame(minWidth: 100, alignment: .center)
                            .padding(.vertical, 10)
                            .background(Color.gray)
                            .border(Color.black)
                    }
                }

                Divider()

                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(data, id: \.self) { row in
                            HStack(spacing: 0) {
                                ForEach(row, id: \.self) { cell in
                                    Text(cell)
                                        .frame(minWidth: 100, alignment: .center)
                                        .padding(.vertical, 10)
                                        .border(Color.black)
                                }
                            }
                            Divider()
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let columns = ["Column 1", "Column 2", "Column 3"]
        let data = [
            ["A1", "A2", "A3"],
            ["B1", "B2", "B3"],
            ["C1", "C2", "C3"]
        ]

        return HomeView(columns: columns, data: data)
    }
}
