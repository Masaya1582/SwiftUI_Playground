//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = UsersViewModel()

    var body: some View {
        VStack {
            Button("URLSession") {
                viewModel.fetchUsersWithURLSession()
            }
            .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .orange))
            Button("Alamofire") {
                viewModel.fetchUsersWithAlamofire()
            }
            .modifier(ButtonModifier(foregroundColor: .white, backgroundColor: .green))
            List(viewModel.users) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.email)
                        .font(.subheadline)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
