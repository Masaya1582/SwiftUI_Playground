//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var image: UIImage?
    @State private var showingAlert: Bool = false

    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)
            } else {
                Text("No Image")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 20))
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 200)
                    .background(Color(UIColor.lightGray))
            }

            Button {
                showingAlert = true
            } label: {
                Text("Select Image")
                    .font(.custom(FontFamily.Caprasimo.regular, size: 20))
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 100)
                    .padding(.vertical, 16)
                    .background(Color(UIColor.lightGray))
            }
            .padding(.top, 60)
        }
        .sheet(isPresented: $showingAlert) {
        } content: {
            ImagePicker(image: $image)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
