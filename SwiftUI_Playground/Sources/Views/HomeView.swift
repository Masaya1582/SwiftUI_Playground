//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var scores = Array(repeating: Array(repeating: 0, count: 4), count: 10)
    @State private var playerCount = 4

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    HStack(spacing: 0) {
                        ForEach(0..<playerCount, id: \.self) { playerIndex in
                            VStack {
                                Text("P\(playerIndex + 1)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(minWidth: 80, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                                    .background(Color.gray)
                                ForEach(0..<scores.count, id: \.self) { roundIndex in
                                    ScoreCell(score: $scores[roundIndex][playerIndex])
                                }
                                TotalScoreCell(total: totalScore(for: playerIndex))
                            }
                        }
                    }
                }
                .background(Color.black)

                Spacer()

                HStack {
                    Button(action: addPlayer) {
                        Label("Add Player", systemImage: "person.fill.badge.plus")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)

                    Button(action: removePlayer) {
                        Label("Remove Player", systemImage: "person.fill.badge.minus")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)

                    Button(action: addRound) {
                        Label("Add Round", systemImage: "plus.circle.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)

                    Button(action: removeRound) {
                        Label("Remove Round", systemImage: "minus.circle.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 20)
                .frame(height: 50)
            }
            .navigationTitle("Scorekeeper")
        }
        .preferredColorScheme(.dark)
    }

    private func totalScore(for playerIndex: Int) -> Int {
        scores.map { $0[playerIndex] }.reduce(0, +)
    }

    private func addRound() {
        scores.append(Array(repeating: 0, count: playerCount))
    }

    private func removeRound() {
        if scores.count > 1 {
            scores.removeLast()
        }
    }

    private func addPlayer() {
        guard playerCount < 6 else { return }
        playerCount += 1
        for i in 0..<scores.count {
            scores[i].append(0)
        }
    }

    private func removePlayer() {
        guard playerCount > 1 else { return }
        playerCount -= 1
        for i in 0..<scores.count {
            scores[i].removeLast()
        }
    }
}

struct ScoreCell: View {
    @Binding var score: Int

    var body: some View {
        TextField("0", value: $score, formatter: NumberFormatter())
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .frame(minWidth: 80, idealWidth: 100, maxWidth: .infinity, alignment: .center)
            .background(Color.black)
            .foregroundColor(.white)
    }
}

struct TotalScoreCell: View {
    let total: Int

    var body: some View {
        Text("\(total)")
            .font(.headline)
            .frame(minWidth: 80, idealWidth: 100, maxWidth: .infinity, alignment: .center)
            .background(Color.blue)
            .foregroundColor(.white)
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
