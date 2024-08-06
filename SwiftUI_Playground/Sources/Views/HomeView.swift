//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isActionSheetPresented = false

    var body: some View {
        VStack {
            Button("Show Action Sheet") {
                isActionSheetPresented = true
            }
            .actionSheet(isPresented: $isActionSheetPresented) {
                ActionSheet(
                    title: Text("Actions"),
                    message: Text("Choose an action"),
                    buttons: [
                        .default(Text("Action 1"), action: {
                            print("Action 1 selected")
                        }),
                        .default(Text("Action 2"), action: {
                            print("Action 2 selected")
                        }),
                        .destructive(Text("Delete"), action: {
                            print("Delete action selected")
                        }),
                        .cancel(Text("Cancel"), action: {
                            print("Cancel action selected")
                        })
                    ]
                )
            }
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
