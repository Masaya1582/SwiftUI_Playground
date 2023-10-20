//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import SDWebImageSwiftUI
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

struct HomeView: View {

    var body: some View {
        VStack {
            Text("Remote Image Example")
                .font(.title)
                .padding()

            SDImageView(imageUrl: "https://masasophi.com/wp-content/uploads/2023/05/normal_swift.001.png")
                .frame(width: 200, height: 200)
                .cornerRadius(10)
                .padding()
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
