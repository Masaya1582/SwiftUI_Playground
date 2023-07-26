//
//  HomeModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}
