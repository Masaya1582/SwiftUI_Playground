//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        Button {
            openCalendar()
        } label: {
            Text("Open Calendar")
                .font(.title)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

        }
    }

    private func openCalendar() {
        if let url = URL(string: "calshow:") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
