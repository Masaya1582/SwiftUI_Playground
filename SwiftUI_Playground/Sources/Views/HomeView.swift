//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

struct HomeView: View {
    @State private var countdown: Int = 59
    @State private var initialCountdown: Int = 59
    @State private var timer: Timer.TimerPublisher = Timer.publish(every: 1, on: .main, in: .common)
    @State private var cancellable: Cancellable?
    @State private var sequenceNumber: Int = 0
    @State private var isPlaying: Bool = false
    @State private var highlightedNumbers: Set<Int> = []
    @State private var showRestartButton: Bool = false
    @State private var showEditSheet: Bool = false

    let buttonNumbers = 1...4

    var body: some View {
        NavigationView {
            VStack {
                Text("REST")
                    .font(.caption)
                    .foregroundColor(.gray)

                Text(String(format: "%02d:%02d", countdown / 60, countdown % 60))
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .padding(.vertical)

                Button(action: {
                    self.isPlaying.toggle()
                    if self.isPlaying {
                        self.startTimer()
                    } else {
                        self.resetTimer()
                    }
                }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .foregroundColor(.black)
                }
                .padding(.vertical)

                HStack {
                    ForEach(buttonNumbers, id: \.self) { number in
                        Button(action: {
                            self.sequenceNumber = number
                            self.highlightSequence(number: number)
                        }) {
                            Text("\(number)")
                                .frame(width: 44, height: 44)
                                .font(.title)
                                .foregroundColor(.white)
                                .background(self.highlightedNumbers.contains(number) ? Color.blue : Color.gray)
                                .clipShape(Circle())
                        }
                    }
                }

                if showRestartButton {
                    Button(action: {
                        self.resetAll()
                    }) {
                        Text("Restart")
                            .font(.system(size: 17, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .frame(height: 44)
                            .padding(.vertical, 5)
                            .background(Color.primary)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showEditSheet = true
                    }) {
                        Image(systemName: "pencil")
                            .foregroundColor(.black)
                    }
                }
            }
            .sheet(isPresented: $showEditSheet) {
                EditRestTimeView(countdown: $countdown, initialCountdown: $initialCountdown, showEditSheet: $showEditSheet)
            }
            .navigationTitle("Timer")
        }
    }

    private func startTimer() {
        self.isPlaying = true
        self.cancellable = self.timer.autoconnect().sink { _ in
            if self.countdown > 0 {
                self.countdown -= 1
            } else {
                self.sequenceNumber = (self.sequenceNumber % buttonNumbers.count) + 1
                self.highlightSequence(number: self.sequenceNumber)
                self.countdown = self.initialCountdown
                self.resetTimer()
            }
        }
    }

    private func resetTimer() {
        self.cancellable?.cancel()
        self.isPlaying = false
    }

    private func highlightSequence(number: Int) {
        highlightedNumbers = Set(1...number)
        showRestartButton = number == 4
    }

    private func resetAll() {
        highlightedNumbers = []
        showRestartButton = false
        sequenceNumber = 0
        countdown = initialCountdown
        resetTimer()
    }
}

struct EditRestTimeView: View {
    @Binding var countdown: Int
    @Binding var initialCountdown: Int
    @Binding var showEditSheet: Bool
    @State private var selectedMinutes: Int = 0
    @State private var selectedSeconds: Int = 0

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Picker("Minutes", selection: $selectedMinutes) {
                        ForEach(0..<60) { minute in
                            Text("\(minute) min").tag(minute)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 150)
                    .clipped()

                    Picker("Seconds", selection: $selectedSeconds) {
                        ForEach(0..<60) { second in
                            Text("\(second) sec").tag(second)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 150)
                    .clipped()
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Edit Rest Time", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                let newCountdown = (selectedMinutes * 60) + selectedSeconds
                countdown = newCountdown
                initialCountdown = newCountdown
                showEditSheet = false
            })
        }
        .onAppear {
            selectedMinutes = countdown / 60
            selectedSeconds = countdown % 60
        }
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
