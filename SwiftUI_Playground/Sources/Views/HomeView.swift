//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import RealmSwift

struct HomeView: View {
    @State private var user: [User] = []
    @ObservedObject var homeViewModel = HomeViewModel()

    var body: some View {
        VStack {
            List {
                ForEach(homeViewModel.users, id: \.self) { user in
                    Text(user.userName) // RealmのDBに存在するuserNameを表示させる
                }
                .onDelete { indexSet in // リストアイテムの削除
                    let deletedItem = self.homeViewModel.users[indexSet.first!]
                    self.homeViewModel.deleteUserName(deletedItem)
                }
            }
            Button { // AddItemViewにモーダル遷移
                homeViewModel.showAddItemView = true
            } label: {
                Text("Add New User")
                    .font(.largeTitle)
            }
        }
        .sheet(isPresented: $homeViewModel.showAddItemView) {
            AddItemView(homeViewModel: homeViewModel)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
