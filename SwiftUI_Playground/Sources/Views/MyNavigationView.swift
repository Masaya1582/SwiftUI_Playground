//
//  MyNavigationView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/01.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            Text("This is Navigation遷移")
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
