//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct AddFriendsPage: View {
    let section1Items = ["Item 1", "Item 2", "Item 3"]
    let section2Items = ["Item 4", "Item 5", "Item 6"]
    @State private var searchText = ""

    private var filteredSection1Items: [String] {
        section1Items.filter { item in
            searchText.isEmpty || item.localizedStandardContains(searchText)
        }
    }

    private var filteredSection2Items: [String] {
        section2Items.filter { item in
            searchText.isEmpty || item.localizedStandardContains(searchText)
        }
    }

    var body: some View {
        VStack {
            TextField("Enter text here", text: $searchText)
                .font(.system(size: 22, weight: .heavy, design: .rounded))
                .foregroundColor(.primary)
                .padding(.horizontal)
                .padding(.vertical)
                .background(Color(red: 241/255, green: 241/255, blue: 241/255))
                .cornerRadius(23, antialiased: true)
                .padding(.horizontal, 20)

            List {
                Section(header:
                            Text("Friend Requests")
                    .font(.system(size: 20, weight: .heavy, design: .rounded))
                    .foregroundColor(Color(red: 192/255, green: 192/255, blue: 192/255))
                ) {
                    ForEach(filteredSection1Items, id: \.self) { item in
                        Button(action: {}) {
                            HStack {
                                Image("chair")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())

                                Text(item)
                                    .font(.system(size: 17, weight: .heavy, design: .rounded))
                                    .foregroundColor(.black)

                                Spacer()

                                Button(action: {}) {
                                    Image(systemName: "xmark")
                                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                                        .foregroundColor(Color(red: 192/255, green: 192/255, blue: 192/255))
                                        .padding()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                }

                                Button(action: {}) {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                                        .foregroundColor(Color(red: 23/255, green: 171/255, blue: 255/255))
                                        .padding()
                                        .frame(width: 40, height: 40)
                                        .background(Color(red: 241/255, green: 241/255, blue: 241/255))
                                        .clipShape(Circle())
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowSeparator(.hidden)
                    }
                }

                Section(header:
                            Text("Phonebook")
                    .font(.system(size: 20, weight: .heavy, design: .rounded))
                    .foregroundColor(Color(red: 192/255, green: 192/255, blue: 192/255))
                ) {
                    ForEach(filteredSection2Items, id: \.self) { item in
                        Button(action: {}) {
                            HStack {
                                Image("chair")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())

                                Text(item)
                                    .font(.system(size: 17, weight: .heavy, design: .rounded))
                                    .foregroundColor(.black)

                                Spacer()

                                Button(action: {}) {
                                    Text("invite")
                                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 20)
                                        .frame(height: 40)
                                        .padding(.vertical, 3)
                                        .background(Color(red: 27 / 255, green: 27 / 255, blue: 27 / 255))
                                        .clipShape(Capsule())
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
            .onDisappear {
                UITableView.appearance().separatorStyle = .singleLine
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        AddFriendsPage()
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
