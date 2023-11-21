//
//  HalfModalView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/11/19.
//

import SwiftUI

struct HalfModalView: View {
    @Binding var halfModalText: String
    @Binding var isShowHalfView: Bool

    var body: some View {
        Text("This is Half Modal View")
            .modifier(CustomLabel(foregroundColor: .black, size: 24))
        TextField("Type Something", text: $halfModalText)
            .modifier(CustomTextField())
        VintageSettingView(iconName: "apple.logo", title: "Apple")
        VintageSettingView(iconName: "apple.logo", title: "Apple")
        Button("Close") {
            isShowHalfView = false
        }
        .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
    }
}

struct HalfModalView_Previews: PreviewProvider {
    @State static var halfModalText = ""
    @State static var isShowHalfView = false
    static var previews: some View {
        HalfModalView(halfModalText: $halfModalText, isShowHalfView: $isShowHalfView)
    }
}
