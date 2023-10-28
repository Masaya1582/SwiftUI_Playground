// 
//  HomeViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var name = ""
    @Published var isFloatingViewVisible = false
    @Published var isOpenImagePicker = false
    @Published var showSourceTypeAlert = false
    @Published var sourceType: UIImagePickerController.SourceType?
    @Published var selectedImage: UIImage?
}
