//
//  Post.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Post: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
