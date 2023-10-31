//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @ObservedObject var viewModel = FriendsListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.friends) { friend in
                Text(friend.name)
                Text("Age: \(friend.age)")
            }
            .navigationBarTitle("Friends List")
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
