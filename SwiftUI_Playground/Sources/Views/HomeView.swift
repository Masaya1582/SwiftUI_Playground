//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Large Title")
                    .font(.largeTitle)
                Text("Title 1")
                    .font(.title)
                Text("Title 2")
                    .font(.title2)
                Text("Title 3")
                    .font(.title3)
                Text("Body")
                    .font(.body)
                Text("Callout")
                    .font(.callout)
                Text("Footnote")
                    .font(.footnote)
                Text("Caption 1")
                    .font(.caption)
                Text("Caption 2")
                    .font(.caption2)
            }
            VStack {
                Text("Large Title")
                    .font(
                        .custom(
                            "Silkscreen-Regular",
                            size: 34
                        )
                    )
                Text("Title 1")
                    .font(
                        .custom(
                            "Silkscreen-Regular",
                            size: 28
                        )
                    )
                Text("Title 2")
                    .font(
                        .custom(
                            "Silkscreen-Regular",
                            size: 22
                        )
                    )
                Text("Title 3")
                    .font(
                        .custom(
                            "Silkscreen-Regular",
                            size: 20
                        )
                    )
                Text("Body")
                    .font(
                        .custom(
                            "Silkscreen-Regular",
                            size: 17
                        )
                    )
                Text("Callout")
                    .font(
                        .custom(
                            "Silkscreen-Regular",
                            size: 16
                        )
                    )
                Text("Footnote")
                    .font(
                        .custom(
                            "Silkscreen-Regular",
                            size: 13
                        )
                    )
                Text("Caption 1")
                    .font(
                        .custom(
                            "Silkscreen-Regular",
                            size: 12
                        )
                    )
                Text("Caption 2")
                    .font(
                        .custom(
                            "Silkscreen-Regular",
                            size: 11
                        )
                    )
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
