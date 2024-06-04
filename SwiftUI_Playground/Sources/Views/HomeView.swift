//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var isRegistered = false
    @State private var username = ""
    @State private var password = ""
    @State private var showProfileCustomization = false
    @State private var showGeneralChat = false
    @State private var userProfile = UserProfile()
    @State private var themeColor: Color = .black

    var body: some View {
        NavigationView {
            VStack {
                ThemeSelectionView(themeColor: $themeColor)
                if isRegistered {
                    ProfileView(userProfile: $userProfile, showProfileCustomization: $showProfileCustomization, showGeneralChat: $showGeneralChat)
                } else {
                    RegistrationLoginView(isRegistered: $isRegistered, username: $username, password: $password)
                }
                Spacer()
                Text("empSKemp")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding([.leading, .bottom], 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle(isRegistered ? "Profile" : "Register/Login")
        }
        .accentColor(themeColor)
        .preferredColorScheme(themeColor == .black ? .dark : .light) // Added to support black theme
    }
}

struct RegistrationLoginView: View {
    @Binding var isRegistered: Bool
    @Binding var username: String
    @Binding var password: String

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
                .padding()
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button(action: {
                isRegistered.toggle()
            }) {
                Text(isRegistered ? "Log In" : "Register")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
            }
            .disabled(username.count < 6 || password.count < 6)
        }
    }
}

struct ProfileView: View {
    @Binding var userProfile: UserProfile
    @Binding var showProfileCustomization: Bool
    @Binding var showGeneralChat: Bool

    var body: some View {
        VStack {
            userProfile.avatar
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()

            Text(userProfile.name)
                .font(.title)

            Button("Customize Profile") {
                showProfileCustomization = true
            }
            .sheet(isPresented: $showProfileCustomization) {
                ProfileCustomizationView(userProfile: $userProfile)
            }

            Button("General Chat") {
                showGeneralChat = true
            }
            .sheet(isPresented: $showGeneralChat) {
                GeneralChatView(userProfile: $userProfile)
            }
        }
    }
}

struct ProfileCustomizationView: View {
    @Binding var userProfile: UserProfile

    var body: some View {
        Text("Profile Customization")
    }
}

struct GeneralChatView: View {
    @Binding var userProfile: UserProfile

    var body: some View {
        Text("General Chat")
    }
}

struct ThemeSelectionView: View {
    @Binding var themeColor: Color

    var body: some View {
        Picker("Theme", selection: $themeColor) {
            Text("Black").tag(Color.black)
            Text("White").tag(Color.white)
        }
        .pickerStyle(.segmented)
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

struct UserProfile {
    var avatar: Image = Image("duck")
    var name: String = "Username"
    var currency: Double = 0.0
}

extension Color {
    static let monochrome = Color.gray
}
