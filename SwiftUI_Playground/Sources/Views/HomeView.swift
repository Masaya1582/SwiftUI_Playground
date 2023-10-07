//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isTimerRunning = false
    @State private var elapsedTime: TimeInterval = 0
    @State private var selectedTask = Task.allTasks[0]
    @State private var timer: Timer?
    private var timerText: String {
        let seconds = Int(elapsedTime) % 60
        let minutes = Int(elapsedTime) / 60
        let hours = minutes / 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    var body: some View {
        VStack {
            Text("Task Timer")
                .font(.largeTitle)
                .padding()

            Text(selectedTask.name)
                .font(.title)

            Text(timerText)
                .font(.system(size: 60))
                .padding()

            HStack {
                Button(action: startTimer) {
                    Text(isTimerRunning ? "Pause" : "Start")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: resetTimer) {
                    Text("Reset")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()

            Picker("Select Task", selection: $selectedTask) {
                ForEach(Task.allTasks, id: \.self) { task in
                    Text(task.name).tag(task)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }

    private func startTimer() {
        if isTimerRunning {
            timer?.invalidate()
        } else {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                elapsedTime += 1
            }
        }
        isTimerRunning.toggle()
    }

    private func resetTimer() {
        timer?.invalidate()
        isTimerRunning = false
        elapsedTime = 0
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
