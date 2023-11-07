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
            VStack {
                ScrollView {
                    ForEach(0..<100) { index in
                        Text("Number: \(index)")
                    }
                    Spacer()

                }
                HStack {
                    Spacer()
                    Button(action: {
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.orange)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding()
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
