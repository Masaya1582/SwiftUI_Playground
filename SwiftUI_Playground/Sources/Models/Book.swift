//
//  Book.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Book: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}
