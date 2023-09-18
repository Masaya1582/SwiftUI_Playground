//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var ipAddress = "0.0.0.0"

    var body: some View {
        VStack {
            Text("Random IP Address")
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
                .padding()

            Text(ipAddress)
                .font(.custom(FontFamily.Caprasimo.regular, size: 24))
                .padding()

            Button {
                ipAddress = generateRandomIPAddress()
            } label: {
                Text("Generate IP Address")
                    .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
            }
        }
    }

    private func generateRandomIPAddress() -> String {
        let octet1 = Int.random(in: 0...255)
        let octet2 = Int.random(in: 0...255)
        let octet3 = Int.random(in: 0...255)
        let octet4 = Int.random(in: 0...255)
        return "\(octet1).\(octet2).\(octet3).\(octet4)"
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
