//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var messages: [ChatMessage] = []
    @State private var myMessage: String = ""
    @State private var friendMessage: String = ""

    var body: some View {
        VStack {
            List(messages) { message in
                ChatBubble(message: message)
            }
            bottomView
        }
    }

    var bottomView: some View {
        VStack {
            HStack {
                TextField("iMessage", text: $friendMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: { sendMessage(content: friendMessage, isMe: false) }) {
                    Text("FriendSend")
                        .frame(width: 100, height: 40)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(8)
                }
                .disabled(!myMessage.isEmpty)
            }
            HStack {
                TextField("iMessage", text: $myMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: { sendMessage(content: myMessage, isMe: true) }) {
                    Text("MySend")
                        .frame(width: 100, height: 40)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .disabled(!friendMessage.isEmpty)
            }
        }
        .padding()
    }

    private func sendMessage(content: String, isMe: Bool) {
        let message = ChatMessage(content: content, isMe: isMe)
        messages.append(message)
        myMessage = ""
        friendMessage = ""
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
