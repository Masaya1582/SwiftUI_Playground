//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var restaurantName: String = ""
    @State private var mealName: String = ""
    @State private var price: String = ""
    @State private var review: String = ""
    @State private var images: [UIImage] = []
    @State private var showImagePicker: Bool = false
    @State private var isHomeCooked: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Toggle("Home Cooked", isOn: $isHomeCooked)
                    .padding()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(images.indices, id: \.self) { index in
                            Image(uiImage: images[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .padding()
                                .onTapGesture {
                                    images.remove(at: index)
                                }
                        }
                    }
                }

                Button(action: {
                    showImagePicker = true
                }) {
                    Label("Add Photo", systemImage: "camera")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(images: $images)
                }

                if !isHomeCooked {
                    TextField("Enter restaurant name", text: $restaurantName)
                        .textFieldStyle(.roundedBorder)
                        .padding()

                    TextField("Enter price", text: $price)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                        .padding()
                }

                TextField("Enter meal name", text: $mealName)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                TextField("Enter review", text: $review)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Button(action: logMeal) {
                    Text("Log Meal")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                Spacer()
            }
            .navigationTitle("Food Log")
        }
    }

    private func logMeal() {
        if isHomeCooked {
            print("Meal logged: \(mealName), Review: \(review)")
        } else {
            print("Meal logged: \(restaurantName) - \(mealName) - Price: \(price), Review: \(review)")
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var images: [UIImage]

    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.images.append(image)
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
