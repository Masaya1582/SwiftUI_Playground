//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    // Vintage Style Login View
    @State private var emailAddress = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "lock.shield.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.top, 100)
                    .padding(.bottom, 50)

                VStack(alignment: .leading, spacing: 24) {
                    TextField("Email Address", text: $emailAddress)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .shadow(radius: 5.0)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .shadow(radius: 5.0)
                }
                .padding(.horizontal, 40)

                Button(action: {
                    print("Button was tapped")
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                .padding(.top, 50)

                Spacer()

                NavigationLink(
                    destination: EmptyView()
                        .navigationBarHidden(true),
                    label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.system(size: 14, weight: .light))
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    }
                )
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
