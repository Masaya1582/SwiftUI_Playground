//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var count = 3
    @State private var timer: Timer?
    @State private var quizTimer: Timer?
    @State private var currentIndex = 0
    @State private var shuffledArray: [String] = []
    @State private var firstQuizArray: [String] = []
    @State private var actualQuizArray: [String] = []
    @State private var realQuizArray: [String] = []
    @State private var isShowAnswerView = false

    var body: some View {
        NavigationStack {
            VStack {
                if count > 0 {
                    Text("\(count)")
                        .modifier(CustomLabel(foregroundColor: .black, size: 48))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 120)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 200)
                                .shadow(color: .gray, radius: 4, x: 0, y: 2)
                        )
                } else {
                    if currentIndex < realQuizArray.count {
                        Text(realQuizArray[currentIndex])
                            .modifier(CustomLabel(foregroundColor: .black, size: 48))
                    }
                }
                NavigationLink("", isActive: $isShowAnswerView) {
                    AnswerView(correctAnswer: $actualQuizArray)
                }
                .hidden()
            }
        }
        .onAppear {
            shuffledArray = loadCSV().shuffled()
            firstQuizArray.append(shuffledArray[0])
            actualQuizArray = firstQuizArray.first?
                .components(separatedBy: ",")
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) } ?? []
            realQuizArray = actualQuizArray
            realQuizArray.shuffle()
            print("最初: \(firstQuizArray)")
            print("実際のクイズ配列: \(actualQuizArray)")
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if count > 0 {
                count -= 1
                if count == 0 {
                    startQuizTimer()
                }
            }
        }
    }

    private func startQuizTimer() {
        quizTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            if currentIndex < realQuizArray.count {
                currentIndex += 1
            } else {
                quizTimer?.invalidate()
                quizTimer = nil
                isShowAnswerView = true
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        quizTimer?.invalidate()
        timer = nil
        quizTimer = nil
        currentIndex = 0
    }

    private func loadCSV() -> [String] {
        guard let csvBundle = Bundle.main.path(forResource: "quiz1", ofType: "csv") else {
            fatalError("ファイルが見つかりません")
        }
        var dataArray: [String] = []
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: .utf8)
            dataArray = csvData.components(separatedBy: "\n")
            dataArray.removeLast()
        } catch {
            print("エラー: \(error)")
        }
        return dataArray
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
