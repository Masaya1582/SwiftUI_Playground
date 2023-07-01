//
//  AddItemView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/07/01.
//

import SwiftUI

struct AddItemView: View {
    @ObservedObject var homeViewModel: HomeViewModel // HomeViewでインスタンス化したHomeViewModelをバインディング
    @ObservedObject var addItemViewModel = AddItemViewModel()

    var body: some View {
        VStack {
            Form {
                TextField("User name", text: $addItemViewModel.userName) // 入力値はAddItemViewModelで管理
            }
            Button {
                if addItemViewModel.userName == "" { // TextFieldが空の場合はアラートを出す
                    addItemViewModel.showAlert = true
                } else { // それ以外はRealmにTextFieldの入力値を登録する(realm.write)
                    addItemViewModel.addNewUserName(homeViewModel)
                    homeViewModel.showAddItemView = false
                }
            } label: {
                Text("Add New User")
                    .font(.largeTitle)
            }
        }
        .alert("入力が不十分です", isPresented: $addItemViewModel.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    @State static var homeViewModel = HomeViewModel()
    static var previews: some View {
        AddItemView(homeViewModel: homeViewModel)
    }
}
