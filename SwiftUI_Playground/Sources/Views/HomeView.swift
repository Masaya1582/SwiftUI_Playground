//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject var userViewModel = UserViewModel()

    var body: some View {
        VStack {
            if let user = userViewModel.user {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name: \(user.name)")
                    Text("Username: \(user.userName)")
                    Text("Email: \(user.email)")
                    Text("Phone: \(user.phone)")
                }
                .padding()
            } else if userViewModel.isLoading {
                ProgressView("Loading User Info...")
            } else {
                Text("No User found.")
            }
        }
        .onAppear {
            let id = Int.random(in: 1...10)
            userViewModel.fetchUsers(id: id)
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
