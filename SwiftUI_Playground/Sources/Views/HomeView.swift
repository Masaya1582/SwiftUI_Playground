//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NoMessagesState()
    }
}

struct NoMessagesState: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "message.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .foregroundColor(.gray)
                .padding(.vertical, 20)

            VStack(alignment: .center) {
                Text("No Messages")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundColor(.primary)
                    .padding(.vertical, 10)

                Text("Messages you send or recieve will appear here")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
            }
            Spacer()
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
