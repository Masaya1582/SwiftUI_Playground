//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var showAlert = false

    var body: some View {
        ZStack {
            if showAlert {
                FancyAlertView(isShowing: $showAlert)
            } else {
                Button {
                    self.showAlert.toggle()
                } label: {
                    Text("Show Fancy Alert")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .animation(.easeInOut(duration: 0.4))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
