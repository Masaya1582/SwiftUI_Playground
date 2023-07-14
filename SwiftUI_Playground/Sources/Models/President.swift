//
//  DefaultModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct President: Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let image: Image

    init(firstName: String, lastName: String, image: Image) {
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
    }
}

struct GridCell: View {
    var president: President

    var body: some View {
        VStack {
            president.image
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(color: .primary, radius: 5)
                .padding([.horizontal, .top], 7)
            Text(president.firstName).lineLimit(1)
            Text(president.lastName).lineLimit(1)
        }
    }
}
