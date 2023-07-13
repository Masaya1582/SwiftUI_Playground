//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        if let image = UIImage(named: "img_dio") {
            PhotoDetailView(image: image)
                .ignoresSafeArea()
        } else {
            EmptyView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
