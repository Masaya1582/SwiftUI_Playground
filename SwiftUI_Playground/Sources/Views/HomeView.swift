//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var searchText: String = ""
    @State private var selectedTab: Int = 0

    private let chats = [
        Chat(name: "John Doe", message: "Hey, how are you?", isUnread: true),
        Chat(name: "Jane Smith", message: "Let's meet up later!", isUnread: false),
        Chat(name: "Michael Brown", message: "Check out this cool link!", isUnread: true)
    ]

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 10)

                    TextField("Search", text: $searchText)
                        .padding(10)
                        .padding(.leading, -10)
                }
                .background(Color(.systemGray6))
                .cornerRadius(15)
                .padding(.horizontal)

                TabView(selection: $selectedTab) {
                    List(chats) { chat in
                        HStack {
                            Image(systemName: "person.fill")
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color(red: 230 / 255, green: 230 / 255, blue: 232 / 255), lineWidth: 1.5))

                            VStack(alignment: .leading) {
                                Text(chat.name)
                                    // .font(.system(size: 17, weight: Font.Weight.medium, design: .default))
                                    .foregroundColor(chat.isUnread ? .black : .gray)

                                Text(chat.message)
                                    .font(.system(size: 12, design: .default))
                                    .foregroundColor(chat.isUnread ? .black : .gray)
                            }

                            Spacer()

                            Text("12:34")
                                .font(.system(size: 12, design: .default))
                                .foregroundColor(chat.isUnread ? .black : .gray)
                        }
                    }
                    .tabItem {
                        Image(systemName: "message.fill")
                        Text("Chats")
                    }
                    .tag(0)

                    Text("Status")
                        .tabItem {
                            Image(systemName: "circle.grid.cross.fill")
                            Text("Status")
                        }
                        .tag(1)

                    Text("Calls")
                        .tabItem {
                            Image(systemName: "phone.fill")
                            Text("Calls")
                        }
                        .tag(2)
                }
                .accentColor(.black)
            }
            .navigationBarTitle("WhatsApp", displayMode: .inline)
            .navigationBarItems(trailing:
                                    HStack {
                Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.black)
                }
            }
            )
        }
    }
}

struct Chat: Identifiable {
    let id = UUID()
    let name: String
    let message: String
    let isUnread: Bool
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
