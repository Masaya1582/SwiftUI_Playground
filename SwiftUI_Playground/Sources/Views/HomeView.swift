//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    var body: some View {
        VStack(spacing: 12) {
            Button {
                FirebaseAnalytics.logEvent(.eventOne)
            } label: {
                Text("Event1")
            }
            Button {
                FirebaseAnalytics.logEvent(.eventTwo)
            } label: {
                Text("Event2")
            }
            Button {
                FirebaseAnalytics.logEvent(.eventThree)
            } label: {
                Text("Event3")
            }
            Button {
                FirebaseAnalytics.logEvent(.eventWithParameter("Hello World"))
            } label: {
                Text("EventWithParameter")
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
