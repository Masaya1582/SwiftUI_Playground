//
//  Movie.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    var id = UUID()
    var title: String
    var poster: String
}
