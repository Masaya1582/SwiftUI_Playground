//
//  PhotoPickerView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/09/09.
//

import SwiftUI
import PhotosUI

@available(iOS 14.0, *)
struct PhotoPickerView: View {
    @Binding var selectedImages: [UIImage]

    var body: some View {
        PhotoPicker(selectedImages: $selectedImages)
            .navigationBarTitle("Photo Album", displayMode: .inline)
    }
}

@available(iOS 14.0, *)
struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedImages: [UIImage]

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 0 // Set to 0 for unlimited selection
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PhotoPicker

        init(_ parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.selectedImages.removeAll()

            for result in results {
                result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { url, error in
                    if let error = error {
                        print("Error loading image: \(error)")
                        return
                    }

                    if let url = url, let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
                        self.parent.selectedImages.append(image)
                    }
                }
            }

            picker.dismiss(animated: true)
        }
    }
}
