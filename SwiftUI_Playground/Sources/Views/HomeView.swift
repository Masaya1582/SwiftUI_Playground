//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var users: [User] = []
    @State private var errorItem: ErrorItem?

    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                Text(user.name)
            }
            .navigationBarTitle("Users")
            .onAppear {
                fetchUserData()
            }
            .alert(item: $errorItem) { errorItem in
                Alert(title: Text("Error"), message: Text(errorItem.message), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func fetchUserData() {
        NetworkService.shared.fetchUsers { result in
            switch result {
            case .success(let fetchUsers):
                users = fetchUsers
            case .failure(let error):
                errorItem = ErrorItem(message: error.localizedDescription)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
