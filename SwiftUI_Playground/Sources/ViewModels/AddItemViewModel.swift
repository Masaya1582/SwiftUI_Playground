//
//  AddItemViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/01.
//

import RealmSwift
import SwiftUI

class AddItemViewModel: ObservableObject {
    @Published var userName = ""
    @Published var showAlert = false
    private var realm = try! Realm()

    // アイテム追加処理
    func addNewUserName(_ homeViewModel: HomeViewModel) {
        realm = try! Realm()
        try! realm.write {
            let user = User()
            user.userName = userName
            realm.add(user)
        }
        homeViewModel.users = Array(realm.objects(User.self))
    }
}
