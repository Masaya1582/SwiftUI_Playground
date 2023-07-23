//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var fileUrl: URL?
    @State private var showingPicker = false

    var body: some View {
        VStack {
            Button {
                guard let documentDirectoryUrl = FileManager.default.urls( for: .documentDirectory, in: .userDomainMask ).first else { return }
                let fileUrl = documentDirectoryUrl.appendingPathComponent("snorlax.txt")
                do {
                    try "I Love Snorlax!".data(using: .utf8)!.write(to: fileUrl, options: .atomic)
                } catch {
                    print("Error: \(error)")
                }

            } label: {
                Text("Save File to Document")
            }

            Button {
                showingPicker = true
            } label: {
                Text("Show File Picker")
            }

            Text("FileUrl: \(fileUrl?.description ?? "nil")")
        }
        .sheet(isPresented: $showingPicker) {
            DocumentPickerView(fileUrl: $fileUrl)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
