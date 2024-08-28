//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    private let sampleFlowers = [
        Flower(name: "Rose", scientificName: "Rosa", description: "Roses are a popular flower known for their beauty and fragrance.", imageName: "rose"),
        Flower(name: "Tulip", scientificName: "Tulipa", description: "Tulips are spring-blooming perennials that grow from bulbs.", imageName: "tulip"),
        Flower(name: "Sunflower", scientificName: "Helianthus", description: "Sunflowers are known for their large, bright yellow petals.", imageName: "sunflower"),
        Flower(name: "Orchid", scientificName: "Orchidaceae", description: "Orchids are a diverse and widespread family of flowering plants.", imageName: "orchid")
    ]

    var body: some View {
        NavigationView {
            List(sampleFlowers) { flower in
                NavigationLink(destination: FlowerDetailView(flower: flower)) {
                    FlowerRowView(flower: flower)
                }
            }
            .navigationTitle("Flower Book")
        }
    }
}

struct FlowerDetailView: View {
    let flower: Flower

    var body: some View {
        ScrollView {
            VStack {
                Image(flower.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 300)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding()

                Text(flower.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                Text(flower.scientificName)
                    .font(.title2)
                    .foregroundColor(.secondary)

                Text(flower.description)
                    .font(.body)
                    .padding()
            }
        }
        .navigationBarTitle(Text(flower.name), displayMode: .inline)
    }
}

struct FlowerRowView: View {
    let flower: Flower

    var body: some View {
        HStack {
            Image(flower.imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(10)
                .shadow(radius: 5)

            VStack(alignment: .leading) {
                Text(flower.name)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(flower.scientificName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(flower.description)
                    .font(.body)
                    .lineLimit(3)
                    .padding(.top, 4)
            }
            .padding(.leading, 10)

            Spacer()
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
