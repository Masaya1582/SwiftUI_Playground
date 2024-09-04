//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Speech

struct HomeView: View {
    @State private var transcription = "Press Start to Speak"
    @State private var isRecording = false
    private let speechRecognizer = SpeechRecognizer()

    var body: some View {
        VStack {
            Text(transcription)
                .font(.largeTitle)
                .padding()

            Button(action: {
                if isRecording {
                    speechRecognizer.stopRecording()
                } else {
                    speechRecognizer.startRecording { result in
                        self.transcription = result
                    }
                }
                isRecording.toggle()
            }) {
                Text(isRecording ? "Stop Recording" : "Start Recording")
                    .font(.title)
                    .padding()
                    .background(isRecording ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
        }
        .padding()
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
