//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var enteredNumber = ""
    private let numberButtons: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["*", "0", "#"]
    ]

    var body: some View {
        VStack {
            Text("Dial Pad")
                .font(.largeTitle)
                .padding()
            Spacer()
            Text(enteredNumber)
                .font(.largeTitle)
                .padding()
            Spacer()
            VStack(spacing: 10) {
                ForEach(0..<4, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(0..<3, id: \.self) { col in
                            Button(action: {
                                let number = numberButtons[row][col]
                                enteredNumber.append(number)
                            }) {
                                Text(numberButtons[row][col])
                                    .font(.title)
                                    .frame(width: 100, height: 100)
                                    .background(Color.black)
                                    .cornerRadius(30)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
            Spacer()
            Button("Clear") {
                enteredNumber = ""
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .red))
        }
        .padding()
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
