//
//  SwiftUIImagePicker.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import Foundation
import SwiftUI

struct SwiftUIImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var showCameraView: Bool

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let viewController = UIImagePickerController()
        viewController.delegate = context.coordinator
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            viewController.sourceType = .camera
        }
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        print("updateUIViewController is called")
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: SwiftUIImagePicker
        init(_ parent: SwiftUIImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            // user picked an image
            if let uiImage = info[.originalImage] as? UIImage {
                self.parent.image = uiImage
            }
            self.parent.showCameraView = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.showCameraView = false
        }
    }

}
