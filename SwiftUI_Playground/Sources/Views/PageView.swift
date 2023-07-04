//
//  PageView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/04.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    @State private var currentPage = 0
    private var viewControllers: [UIHostingController<Page>]

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        ZStack(alignment: .top) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .padding(.trailing)
                .padding(.top, 100)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    struct PreviewWrapper: View {
        @State var views = [Text("Kizaki"), Text("Nonomura"), Text("Obokata")]
        var body: some View {
            PageView(views)
        }
    }
}
