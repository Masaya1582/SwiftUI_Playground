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
                    userInformationField(user)
                    addressField(user)
                    companyInformationField(user)
                    fetchButton()
                } else {
                    loadingField()
                }
            }
            .onAppear {
                let userID = Int.random(in: 1 ... 10)
                userViewModel.fetchUsers(id: userID)
            }
            .navigationTitle("User Detail")
        }
    }

    @ViewBuilder
    private func userInformationField(_ user: User) -> some View {
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
    }

    @ViewBuilder
    private func addressField(_ user: User) -> some View {
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
    }

    @ViewBuilder
    private func companyInformationField(_ user: User) -> some View {
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
    }

    @ViewBuilder
    private func fetchButton() -> some View {
        Section {
            Button(action: {
                let userID = Int.random(in: 1 ... 10)
                userViewModel.fetchUsers(id: userID)
            }, label: {
                HStack {
                    Spacer()
                    Text("Fetch Another User")
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                    Spacer()
                }
            })
        }
    }

    @ViewBuilder
    private func loadingField() -> some View {
        Section {
            HStack {
                Spacer()
                ProgressView("Loading User...")
                Spacer()
            }
        }
    }

}

#Preview {
    UserDetailView()
}
