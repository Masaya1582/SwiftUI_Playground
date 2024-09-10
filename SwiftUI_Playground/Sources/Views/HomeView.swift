//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var chatViewModel = ChatViewModel()
    @State private var messageTextMichael: String = ""
    @State private var messageTextLincoln: String = ""
    @State private var senderNameMichael: String = "Michael"
    @State private var senderNameLincoln: String = "Lincoln"

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(chatViewModel.messages) { message in
                        HStack {
                            if message.sender == senderNameMichael {
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Text("\(message.sender):")
                                        .bold()
                                        .font(.system(size: 12))
                                    Text(message.text)
                                        .padding(10)
                                        .background(Color.blue.opacity(0.3))
                                        .cornerRadius(8)
                                }
                            } else if message.sender == senderNameLincoln {
                                VStack(alignment: .leading) {
                                    Text("\(message.sender):")
                                        .bold()
                                        .font(.system(size: 12))
                                    Text(message.text)
                                        .padding(10)
                                        .background(Color.green.opacity(0.3))
                                        .cornerRadius(8)
                                }
                                Spacer()
                            }
                        }
                        .padding([.leading, .trailing], 10)
                    }
                }
            }
            Divider().padding(.vertical, 10)
            HStack {
                TextField("Enter message (Michael)", text: $messageTextMichael)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 30)
                Button {
                    if !messageTextMichael.isEmpty {
                        chatViewModel.sendMessage(text: messageTextMichael, sender: senderNameMichael)
                        messageTextMichael = ""
                    }
                } label: {
                    Text("Send as Michael")
                        .bold()
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            HStack {
                TextField("Enter message (Lincoln)", text: $messageTextLincoln)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 30)
                Button {
                    if !messageTextLincoln.isEmpty {
                        chatViewModel.sendMessage(text: messageTextLincoln, sender: senderNameLincoln)
                        messageTextLincoln = ""
                    }
                } label: {
                    Text("Send as Lincoln")
                        .bold()
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
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
