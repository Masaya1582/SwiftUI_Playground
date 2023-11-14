// 
//  NASAViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Combine

final class NASAViewModel: ObservableObject {
    @Published var nasaData: NASAData?
    @Published var imageData: Data?

    func fetchData(key apiKey: String) {
        let urlString = "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)"

        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(NASAData.self, from: data)
                DispatchQueue.main.async {
                    self.nasaData = decodedData
                    if let imageURL = URL(string: decodedData.hdurl) {
                        self.fetchImageData(from: imageURL)
                    }
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
    }

    private func fetchImageData(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching image data: \(error.localizedDescription)")
                return
            }
            if let imageData = data {
                DispatchQueue.main.async {
                    self.imageData = imageData
                }
            }
        }
        task.resume()
    }
}
