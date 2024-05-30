//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {

                    Text("Stories")
                        .font(.system(size: 20, design: .default))
                        .foregroundColor(.black)
                        .padding(.leading)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0..<10) { _ in
                                VStack {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color(red: 230 / 255, green: 230 / 255, blue: 232 / 255), lineWidth: 1.5))

                                    Text("Username")
                                        .font(.system(size: 12, design: .default))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    ForEach(0..<10) { _ in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color(red: 230 / 255, green: 230 / 255, blue: 232 / 255), lineWidth: 1.5))

                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Username")
                                        // .font(.system(size: 17, weight: Font.Weight.medium, design: .default))
                                        .foregroundColor(.black)

                                    Text("Location")
                                        .font(.system(size: 12, design: .default))
                                        .foregroundColor(Color(red: 138 / 255, green: 138 / 255, blue: 138 / 255))
                                }

                                Spacer()

                                Button(action: {}) {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.black)
                                }
                            }

                            Image("placeholder")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .clipped()

                            HStack {
                                Button(action: {}) {
                                    Image(systemName: "heart")
                                        .foregroundColor(.black)
                                }

                                Button(action: {}) {
                                    Image(systemName: "bubble.right")
                                        .foregroundColor(.black)
                                }

                                Button(action: {}) {
                                    Image(systemName: "paperplane")
                                        .foregroundColor(.black)
                                }

                                Spacer()

                                Button(action: {}) {
                                    Image(systemName: "bookmark")
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.vertical)

                            Text("Liked by username and others")
                                // .font(.system(size: 17, weight: Font.Weight.medium, design: .default))
                                .foregroundColor(.black)

                            Text("Caption")
                                // .font(.system(size: 17, weight: Font.Weight.medium, design: .default))
                                .foregroundColor(.black)

                            Text("View all comments")
                                .font(.system(size: 12, design: .default))
                                .foregroundColor(Color(red: 138 / 255, green: 138 / 255, blue: 138 / 255))

                            Text("2 hours ago")
                                .font(.system(size: 12, design: .default))
                                .foregroundColor(Color(red: 138 / 255, green: 138 / 255, blue: 138 / 255))
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarTitle("Instagram", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {}) {
                Image(systemName: "camera")
                    .foregroundColor(.black)
            }, trailing: Button(action: {}) {
                Image(systemName: "paperplane")
                    .foregroundColor(.black)
            })
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
