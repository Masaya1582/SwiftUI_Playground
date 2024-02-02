//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack(alignment: .leading) {
            Image("img_yoshi") // Replace "yourImageName" with your image asset name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()

            Text("Card Title")
                .font(.title)
                .padding([.leading, .bottom, .trailing])

            Text("Description text goes here. You can add more details about this card.")
                .padding([.leading, .bottom, .trailing])
                .font(.body)
        }
        .background(Color.white) // Change this to any color you like
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding()
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
