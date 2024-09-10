//
//  ChatViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2024/09/10.
//

import FirebaseDatabase

final class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    private var ref: DatabaseReference = Database.database().reference()

    init() {
        observeMessages()
    }

    // メッセージ送信
    func sendMessage(text: String, sender: String) {
        let message = ["text": text, "sender": sender]
        ref.child("messages").childByAutoId().setValue(message)
    }

    // Database内のメッセージ監視
    func observeMessages() {
        ref.child("messages").observe(.childAdded) { snapshot in
            if let data = snapshot.value as? [String: String],
               let text = data["text"],
               let sender = data["sender"] {
                let message = Message(id: snapshot.key, text: text, sender: sender)
                DispatchQueue.main.async {
                    self.messages.append(message)
                }
            }
        }
    }
}
