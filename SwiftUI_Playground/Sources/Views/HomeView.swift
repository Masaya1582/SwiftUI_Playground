//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var responseData: String?
    @State private var responseCode: Int?

    var body: some View {
        VStack(spacing: 28) {
            Button("Make HTTP Request") {
                fetchData()
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .green))
            if let responseData = responseData {
                Text("Response: \(responseData)")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
                if let responseCode = responseCode {
                    Text("Response Code: \(responseCode)")
                        .modifier(CustomLabel(foregroundColor: .black, size: 24))
                } else {
                    Text("Response Code: N/A")
                        .padding()
                }
            }
        }
    }

    private func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                self.responseCode = httpResponse.statusCode
            }

            if let decodedResponse = try? JSONDecoder().decode(Todo.self, from: data) {
                DispatchQueue.main.async {
                    self.responseData = "\(decodedResponse.title)"
                }
            } else {
                print("Failed to decode response")
            }
        }
        task.resume()
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
