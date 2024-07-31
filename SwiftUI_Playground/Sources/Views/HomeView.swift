//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    @State private var selectedAirport = "All"
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var galleryImages: [GalleryImage] = []
    let allAirports = ["All", "JFK", "LAX", "SFO", "ORD", "ATL", "DFW", "DEN", "CLT", "LAS", "PHX", "MIA", "MCO", "EWR", "SEA", "MSP", "DTW", "PHL", "BOS", "LGA", "IAD"]

    var body: some View {
        TabView(selection: $selectedTab) {
            // Post Tab
            NavigationView {
                VStack {
                    Picker("Select an Airport", selection: $selectedAirport) {
                        ForEach(allAirports, id: \.self) { airport in
                            Text(airport).tag(airport)
                        }
                    }
                    .pickerStyle(.menu)

                    Button(action: {
                        showingImagePicker = true
                    }) {
                        if let inputImage = inputImage {
                            Image(uiImage: inputImage)
                                .resizable()
                                .scaledToFit()
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                        ImagePicker(image: $inputImage)
                    }

                    Spacer()

                    Button("Upload Post") {
                        uploadPost()
                        resetPostTab()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                .navigationTitle("Post")
            }
            .tabItem {
                Label("Post", systemImage: "paperplane.fill")
            }
            .tag(0)

            // Gallery Tab
            NavigationView {
                GalleryView(galleryImages: $galleryImages, selectedAirport: $selectedAirport, allAirports: allAirports)
            }
            .tabItem {
                Label("Gallery", systemImage: "photo.on.rectangle.angled")
            }
            .tag(1)
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        let newImage = GalleryImage(image: inputImage, airport: selectedAirport)
        galleryImages.append(newImage)
    }

    func uploadPost() {
        // Implement upload functionality here
    }

    func resetPostTab() {
        inputImage = nil
        selectedAirport = "All"
    }
}

struct GalleryImage: Identifiable {
    let id = UUID()
    let image: UIImage
    let airport: String
}

struct GalleryView: View {
    @Binding var galleryImages: [GalleryImage]
    @Binding var selectedAirport: String
    let allAirports: [String]

    var filteredImages: [GalleryImage] {
        selectedAirport == "All" ? galleryImages : galleryImages.filter { $0.airport == selectedAirport }
    }

    var body: some View {
        VStack {
            Picker("Airport", selection: $selectedAirport) {
                ForEach(allAirports, id: \.self) { airport in
                    Text(airport).tag(airport)
                }
            }
            .pickerStyle(.menu)
            .padding()

            List {
                ForEach(filteredImages) { galleryImage in
                    VStack {
                        Image(uiImage: galleryImage.image)
                            .resizable()
                            .scaledToFit()
                        Text(galleryImage.airport)
                    }
                }
            }
        }
        .navigationTitle("Gallery")
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }

            picker.dismiss(animated: true)
        }
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
