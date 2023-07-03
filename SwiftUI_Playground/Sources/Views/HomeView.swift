//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    // MARK: - ModalSheetItem
    enum ModalSheetItem: Identifiable {
        case nonomura
        case samuragochi
        var id: Int {
            hashValue
        }
    }

    @State private var sheetItem: ModalSheetItem?

    var body: some View {
        VStack(spacing: 32) {
            Button {
                sheetItem = .nonomura
            } label: {
                Text("Show Nonomura")
                    .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: Asset.Colors.mainColor.swiftUIColor))
            }

            Button {
                sheetItem = .samuragochi
            } label: {
                Text("Show Samuragochi")
                    .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: Asset.Colors.backgroundColor.swiftUIColor))
            }
        }
        .sheet(item: $sheetItem) { modalItem in
            switch modalItem {
            case .nonomura:
                NonomuraView()
            case .samuragochi:
                SamuragochiView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
