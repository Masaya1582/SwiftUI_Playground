//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import PhotosUI

struct HomeView: View {
    @State private var selectedImages: [UIImage] = []
    @State private var isPickerPresented = false

    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    isPickerPresented.toggle()
                }) {
                    Text("Open Photo Album")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isPickerPresented) {
                    PhotoPickerView(selectedImages: $selectedImages)
                }

                if !selectedImages.isEmpty {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            ForEach(selectedImages, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitle("Photo Album App", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
