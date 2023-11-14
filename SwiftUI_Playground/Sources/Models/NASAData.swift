//
//  NASAData.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation

struct NASAData: Codable {
    let title: String
    let explanation: String
    let url: String
    let hdurl: String

    init(title: String, explanation: String, url: String, hdurl: String) {
        self.title = title
        self.explanation = explanation
        self.url = url
        self.hdurl = hdurl
    }
}
