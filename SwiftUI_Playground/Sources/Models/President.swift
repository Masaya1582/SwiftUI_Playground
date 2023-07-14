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
    let imageName: String

    init(firstName: String, lastName: String, imageName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.imageName = imageName
    }
}

struct GridCell: View {
    var president: President

    var body: some View {
        VStack {
            Image(president.imageName)
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
