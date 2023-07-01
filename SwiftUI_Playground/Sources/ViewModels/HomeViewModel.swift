// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import RealmSwift
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var showAddItemView = false
    private let realm = try! Realm()

    init() {
        users = Array(realm.objects(User.self))
    }

    // リストアイテムの削除処理
    func deleteUserName(_ user: User) {
        withAnimation(.easeInOut(duration: 0.5)) { // 削除にアニメーションをつけてみる (必須ではない)
            try! realm.write {
                realm.delete(user)
            }
            users = Array(realm.objects(User.self))
        }
        users = Array(realm.objects(User.self))
    }
}
