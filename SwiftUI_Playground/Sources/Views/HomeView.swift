//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var text = ""
    @State private var isEditing = false

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text("Enter text...")
                    .foregroundColor(isEditing ? .accentColor : .gray)
                    .scaleEffect(isEditing ? 0.8 : 1)
                    .offset(x: isEditing ? 0 : 10, y: isEditing ? -10 : 0)
            }

            TextField("", text: $text)
                .onTapGesture {
                    withAnimation {
                        isEditing = true
                    }
                }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isEditing ? Color.accentColor : Color.gray, lineWidth: 1)
        )
        .padding(.horizontal)
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
