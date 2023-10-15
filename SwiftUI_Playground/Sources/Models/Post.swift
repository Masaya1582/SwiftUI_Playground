//
//  Post.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
