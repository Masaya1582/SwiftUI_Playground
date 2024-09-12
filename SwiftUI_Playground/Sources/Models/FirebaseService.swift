//
//  FirebaseService.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2024/09/12.
//

import FirebaseFirestore
import FirebaseStorage
import SwiftUI

final class FirebaseService: ObservableObject {
    @Published var posts = [Post]()
    @Published var showImagePicker = false
    @Published var userName = ""
    @Published var message = ""
    @Published var isLoading = false
    @Published var selectedImage: UIImage?
    private let db = Firestore.firestore()
    private let storage = Storage.storage()

    init() {
        fetchPosts()
    }

    // MARK: - Fetch Posts from Firestore
    func fetchPosts() {
        db.collection("posts").addSnapshotListener { snapshot, error in
            if let error = error {
                print("Error fetching posts: \(error)")
                return
            }
            guard let documents = snapshot?.documents else {
                print("No posts found")
                return
            }
            self.posts = documents.compactMap { doc in
                try? doc.data(as: Post.self)
            }
        }
    }

    // MARK: - Upload Post with Image
    func uploadPost(completion: @escaping() -> Void) {
        isLoading = true
        guard let image = selectedImage else { return }
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        let imageRef = storage.reference().child(UUID().uuidString + ".jpg")

        imageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Error uploading image: \(error)")
                return
            }

            imageRef.downloadURL { [weak self] url, error in
                guard let self = self else { return }
                if let error = error {
                    print("Error fetching image URL: \(error)")
                    return
                }
                guard let imageUrl = url?.absoluteString else {
                    print("Error: Couldn't get the image URL")
                    return
                }
                let newPost = Post(id: UUID().uuidString, imageUrl: imageUrl, userName: self.userName, message: self.message)
                do {
                    try self.db.collection("posts").document(newPost.id).setData(from: newPost)
                    self.isLoading = false
                    completion()
                } catch {
                    print("Error saving post data to Firestore: \(error)")
                    self.isLoading = false
                }
            }
        }
    }
}
