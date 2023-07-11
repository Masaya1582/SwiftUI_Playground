//
//  ListModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct FoodType: Identifiable, Equatable {
    let id: UUID = UUID()
    var name: String
    var foods: [Food]
}

struct Food: Identifiable, Equatable {
    let id: UUID = UUID()
    var check: Bool
    var name: String
}

struct ListRow: View {
    let check: Bool
    let name: String
    var body: some View {
        HStack {
            if check {
                Text("✔︎")
            } else {
                Text(" ")
            }
            Text(name)
            Spacer()
        }
    }
}
