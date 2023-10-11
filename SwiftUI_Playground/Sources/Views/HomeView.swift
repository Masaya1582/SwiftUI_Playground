//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack(spacing: 28) {
            Text("This is a pen")
                .foregroundStyle(.black)
                .padding()
                .shadow(radius: 5)
                .border(.red, width: 4)
                .background(.white)

            Text("This is a book")
                .padding()
                .shadow(color: .red, radius: 5)
                .border(.red, width: 4)

            Text("This is a desk")
                .padding()
                .shadow(color: .red, radius: 5, x: 20, y: 20)
                .border(.red, width: 4)

            Text("This is my life")
                .padding()
                .border(.red, width: 4)
                .shadow(color: .red, radius: 5, x: 20, y: 20)
        }
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
