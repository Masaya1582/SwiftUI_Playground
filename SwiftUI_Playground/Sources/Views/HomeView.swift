//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let pills = ["SwiftUI", "iOS", "Swift", "Xcode", "Cocoa", "Objective-C", "Mobile Development", "Design Patterns", "Core Data", "Concurrency"]

    var body: some View {
        PillCollectionView(pills: pills)
    }
}

struct PillView: View {
    var text: String
    var action: () -> Void

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Text(text)
                .fontWeight(.semibold)
                .font(.system(size: 14))
                .padding(.vertical, 8)
                .padding(.horizontal, 30)
                .frame(minWidth: 100, idealWidth: 150, maxWidth: .infinity, minHeight: 50)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue, lineWidth: 1)
                        .shadow(color: Color.blue.opacity(0.3), radius: 3, x: 0, y: 3)
                )
                .padding(.horizontal)

            Button(action: action) {
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
                    .padding(10)
                    .frame(width: 30, height: 30)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 1)
            }
            .offset(x: 1, y: -5)
        }
    }
}

struct PillCollectionView: View {
    let pills: [String]
    @State private var isCollapsed = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isCollapsed.toggle()
                }
            }) {
                Image(systemName: isCollapsed ? "chevron.down" : "chevron.up")
                    .foregroundColor(.black)
                    .imageScale(.large)
                    .frame(height: 44, alignment: .top)
                    .padding(.top)
            }
            .padding(.horizontal)

            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120), spacing: 10)], spacing: 10) {
                    ForEach(pills, id: \.self) { pill in
                        PillView(text: pill, action: {
                            print("\(pill) pill X button tapped")
                        })
                    }
                }
                .padding()
            }
            .frame(maxHeight: isCollapsed ? 50 : .infinity)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
            .padding(.horizontal)
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
