//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var userInput: String = ""
    @State private var messages: [String] = []

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(messages, id: \.self) { message in
                            ChatBubble(message: message)
                        }
                    }
                }
                .padding()
                .background(Color(red: 0.9, green: 1.0, blue: 0.9)) // Light green background

                HStack {
                    TextField("Type your message...", text: $userInput)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading)

                    Button(action: sendMessage) {
                        Image(systemName: "arrow.right.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing)
                }
            }
            .navigationBarTitle("Chat Room", displayMode: .inline)
        }
    }

    private func sendMessage() {
        guard !userInput.isEmpty else { return }
        messages.append("User: \(userInput)")
        userInput = "" // Clear the input field

        // Simulate a response
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.messages.append("ChatGPT: That's an interesting point!")
        }
    }
}

struct ChatBubble: View {
    let message: String

    var body: some View {
        HStack {
            if message.starts(with: "User: ") {
                Spacer()
                Text(message)
                    .foregroundColor(.green) // Changed text color to green
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            } else {
                Text(message)
                    .foregroundColor(.green) // Changed text color to green
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
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
