//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

class HomeViewViewModel: ObservableObject {
    @Published var toggleValue: Bool = true {
        didSet {
            print("value did change")
        }
    }
}

struct HomeView: View {
    @ObservedObject(initialValue: HomeViewViewModel()) var viewModel: HomeViewViewModel

    var body: some View {
        Toggle(isOn: $viewModel.toggleValue) {
            HStack {
                Text("Value = " + String(viewModel.toggleValue))
                    .font(.custom(FontFamily.Caprasimo.regular, size: 24))
                    .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
