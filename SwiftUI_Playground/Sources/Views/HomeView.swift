//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var downloadStatus: [Bool] = Array(repeating: false, count: 10)

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<10) { index in
                        HStack {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(12)

                            VStack(alignment: .leading) {
                                Text("App Name")
                                    .font(.headline)
                                Text("Developer Name")
                                    .font(.subheadline)
                            }
                            Spacer()
                            Button(action: {
                                downloadButtonTapped(index: index)
                            }) {
                                if downloadStatus[index] {
                                    ProgressView()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.blue)
                                } else {
                                    Image(systemName: "icloud.and.arrow.down")
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("App Store")
        }
    }

    private func downloadButtonTapped(index: Int) {
        downloadStatus[index].toggle()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            downloadStatus[index].toggle()
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
