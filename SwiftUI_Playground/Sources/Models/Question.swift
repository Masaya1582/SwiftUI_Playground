//
//  Question.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct Question {
    let text: String
    let answers: [String]
    let correctAnswerIndex: Int

    init(text: String, answers: [String], correctAnswerIndex: Int) {
        self.text = text
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
}
