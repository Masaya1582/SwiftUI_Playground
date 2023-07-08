//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var scannerModel = ScannerModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(scannerModel.imageArray, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .navigationTitle("VinsonkitSample")
            .toolbar {
                ToolbarItem {
                    Button {
                        openCamera()
                    } label: {
                        Text("Scan")
                            .font(.custom(FontFamily.Caprasimo.regular, size: 24))
                    }
                }
            }
        }
    }

    private func openCamera() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows
        window?.filter({ $0.isKeyWindow }).first?.rootViewController?.present(scannerModel.getDocumentCameraViewController(), animated: true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
