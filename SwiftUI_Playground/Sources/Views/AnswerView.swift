//
//  AnswerView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2024/01/05.
//  Copyright (c) 2024 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct AnswerView: View {
    @State private var answer = ""
    @State private var userAnswer: [String] = []
    @Binding var correctAnswer: [String]
    @State private var showAlert = false
    @State private var alertTitle = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 28) {
                Text("Answer")
                    .modifier(CustomLabel(foregroundColor: .black, size: 32))
                TextField("Answer", text: $answer)
                    .modifier(CustomTextField())
                Button("GO") {
                    userAnswer = answer.components(separatedBy: " ").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                    print("UserAnswer: \(userAnswer)")
                    if userAnswer == correctAnswer {
                        alertTitle = "正解"
                    } else {
                        alertTitle = "不正解"
                    }
                    showAlert = true
                }
                .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), dismissButton: .default(Text("OK")))
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct AnswerView_Previews: PreviewProvider {
    @State static var correctAnswer: [String] = []
    static var previews: some View {
        AnswerView(correctAnswer: $correctAnswer)
    }
}
