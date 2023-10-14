//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private  let texts = [
        L10n.sampleText1,
        L10n.sampleText2,
        L10n.sampleText3,
        L10n.sampleText4,
        L10n.sampleText5,
        L10n.sampleText6,
        L10n.sampleText7,
        L10n.sampleText8,
        L10n.sampleText9,
        L10n.sampleText10
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(texts, id: \.self) { text in
                    Text(text)
                        .modifier(CustomLabel(foregroundColor: .black, size: 24))
                }
            }
            .navigationBarTitle("Texts List")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
