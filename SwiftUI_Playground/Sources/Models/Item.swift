//
//  Item.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/11/16.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import Foundation

struct Item: Codable, Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let pictureURL: URL
}
