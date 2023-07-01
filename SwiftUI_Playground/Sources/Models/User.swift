//
//  User.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import RealmSwift

class User: Object {
    @objc dynamic var userName: String = "" // Realmで管理したいもの
}
