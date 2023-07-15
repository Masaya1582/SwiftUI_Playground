//
//  CountView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/15.
//

import SwiftUI

struct CountView: View {
    @Binding var isCounting: Bool
    @Binding var countText: String
    @State private var count = 0

    var body: some View {
        VStack {
            Text("Count: \(count)")
                .font(.custom(FontFamily.Caprasimo.regular, size: 32))
        }
        .task {
            await startCounting()
        }
    }

    @MainActor
    func startCounting() async {
        while count <= 9 {
            count += 1
             await Task.sleep(1_000_000_000)
        }
        countText = "カウント終了！"
        isCounting = false
    }
}

struct CountView_Previews: PreviewProvider {
    static var previews: some View {
        CountView(isCounting: .constant(false), countText: .constant(""))
    }
}
