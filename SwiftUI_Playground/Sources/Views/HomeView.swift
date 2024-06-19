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
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("album_artwork")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .padding()
                    .background(Color.gray)
                Text("Song Title")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Artist Name")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                HStack {
                    Text("0:00")
                        .foregroundColor(.white)
                    Slider(value: .constant(0.3), in: 0...1)
                        .accentColor(.white)
                    Text("3:30")
                        .foregroundColor(.white)
                }.padding()
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "backward.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }.padding()
                Spacer()
            }
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
