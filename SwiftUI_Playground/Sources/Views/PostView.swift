//
//  PostView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2024/09/12.
//

import SwiftUI

struct PostView: View {
    @StateObject private var firebaseService = FirebaseService()
    @Binding var selectedTab: Int

    var body: some View {
        ZStack {
            VStack {
                imageSelectionSection
                inputFieldsSection
                postButtonSection
            }
            .sheet(isPresented: $firebaseService.showImagePicker) {
                ImagePicker(image: $firebaseService.selectedImage)
                    .ignoresSafeArea()
            }
            if firebaseService.isLoading {
                loadingOverlay
            }
        }
    }

    // MARK: - Image Selection Section
    @ViewBuilder
    private var imageSelectionSection: some View {
        if let image = firebaseService.selectedImage {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: 240, height: 240)
                .cornerRadius(8)
        } else {
            Button(action: {
                firebaseService.showImagePicker = true
            }) {
                Text("Select Image")
                    .font(.title)
                    .padding()
                    .frame(width: 240, height: 48)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(24)
            }
        }
    }

    // MARK: - Input Fields Section
    @ViewBuilder
    private var inputFieldsSection: some View {
        VStack {
            TextField("Username", text: $firebaseService.userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Optional Message", text: $firebaseService.message)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }

    // MARK: - Post Button Section
    @ViewBuilder
    private var postButtonSection: some View {
        Button {
            firebaseService.uploadPost() {
                selectedTab = 0
            }
        } label: {
            Text("Post")
                .font(.title)
                .padding()
                .frame(width: 240, height: 48)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(24)
        }
        .padding()
    }

    // MARK: - Loading Overlay Section
    @ViewBuilder
    private var loadingOverlay: some View {
        Color.black.opacity(0.4)
            .ignoresSafeArea()
        ProgressView("Uploading...")
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}
