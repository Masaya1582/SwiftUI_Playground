//
//  Photo.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Photo: Identifiable {
    let id = UUID()
    let imageName: String
    var isZoomed = false
}
