//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit
import Combine

struct HomeView: View {
    @State private var numbers = [1, 2, 3, 4, 5]
    @State private var flatMappedValues: [Int] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(flatMappedValues, id: \.self) { value in
                    Text("FlatMapped Value: \(value)")
                        .modifier(CustomLabel(foregroundColor: .black, size: 20))
                }
            }
            .navigationBarItems(trailing: Button("Apply Flatmap") {
                applyFlatMap()
            })
        }
    }

    private func applyFlatMap() {
        flatMappedValues = numbers.flatMap { number in
            return [number * 2, number * 3]
        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
