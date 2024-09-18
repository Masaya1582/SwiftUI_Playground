//
//  UserDetailView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2024/09/18.
//

import SwiftUI

struct UserDetailView: View {
    @StateObject private var userViewModel = UserViewModel()

    var body: some View {
        NavigationView {
            Form {
                if let user = userViewModel.users {
                    // User Info Section
                    Section(header: Text("User Information")) {
                        HStack {
                            Text("ID:")
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(user.id)")
                        }

                        HStack {
                            Text("Name:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(user.name)
                        }

                        HStack {
                            Text("Username:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(user.userName)
                        }

                        HStack {
                            Text("Email:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(user.email)
                        }
                    }

                    // Address Section
                    Section(header: Text("Address")) {
                        HStack {
                            Text("Street:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(user.address.street)
                        }

                        HStack {
                            Text("Suite:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(user.address.suite)
                        }

                        HStack {
                            Text("City:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(user.address.city)
                        }

                        HStack {
                            Text("Zipcode:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(user.address.zipcode)
                        }

                        HStack {
                            Text("Geo Coordinates:")
                                .fontWeight(.bold)
                            Spacer()
                            Text("Lat \(user.address.geo.latitude), Lng \(user.address.geo.longitude)")
                        }
                    }

                    // Company Section
                    Section(header: Text("Company Information")) {
                        HStack {
                            Text("Company Name:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(user.company.name)
                        }

                        HStack {
                            Text("Catch Phrase:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(user.company.catchPhrase)
                        }

                        HStack {
                            Text("Business Strategy:")
                                .fontWeight(.bold)
                            Spacer()
                            Text(user.company.bs)
                        }
                    }

                    // Fetch Button
                    Section {
                        Button(action: {
                            let userID = Int.random(in: 1 ... 10)
                            userViewModel.fetchUsers(id: userID)
                        }) {
                            HStack {
                                Spacer()
                                Text("Fetch Another User")
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                        }
                    }
                } else {
                    Section {
                        HStack {
                            Spacer()
                            ProgressView("Loading User...")
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("User Detail")
            .onAppear {
                let userID = Int.random(in: 1 ... 10)
                userViewModel.fetchUsers(id: userID)
            }
        }
    }
}

#Preview {
    UserDetailView()
}
