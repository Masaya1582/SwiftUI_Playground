//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        Text("Check Console for output")
            .modifier(CustomLabel(foregroundColor: .black, size: 20))
            .onAppear {
                fetchData { result in
                    print("Result: \(result)")
                }
            }
    }

    private func fetchData(completion: @escaping(String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let data = "Fetched Data!"
            // Once the data is fetched, we call the completion closure
            completion(data)
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
