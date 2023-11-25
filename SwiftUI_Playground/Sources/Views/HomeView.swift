//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    // Favorite Ramen List View
    @State private var ramen: [Ramen] = [
        Ramen(name: "Spicy Shoyu Ramen", description: "Soy sauce based soup", image: "shoyu_ramen", isSpicy: true, price: 800),
        Ramen(name: "Shio Ramen", description: "Salt based soup", image: "shio_ramen", isSpicy: false, price: 800),
        Ramen(name: "Miso Ramen", description: "Miso based soup", image: "miso_ramen", isSpicy: true, price: 800),
        Ramen(name: "Tonkotsu Ramen", description: "Pork bone based soup", image: "tonkotsu_ramen", isSpicy: false, price: 800),
        Ramen(name: "Tantanmen", description: "Spicy ramen", image: "tantanmen", isSpicy: true, price: 900)
    ]

    var body: some View {
        NavigationView {
            List(ramen, id: \.name) { ramen in
                NavigationLink(destination: RamenDetailView(ramen: ramen)) {
                    RamenRowView(ramen: ramen)
                }
            }
            .navigationTitle("Ramen List")
        }
    }
}

struct RamenDetailView: View {
    let ramen: Ramen

    var body: some View {
        VStack {
            Image(ramen.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
            Text(ramen.description)
                .modifier(CustomLabel(foregroundColor: .black, size: 20))
                .padding(.horizontal)
            Spacer()
        }
        .navigationTitle(ramen.name)
    }
}

struct RamenRowView: View {
    let ramen: Ramen

    var body: some View {
        HStack {
            Image(ramen.image)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(ramen.name)
                    .font(.headline)
                Text("\(ramen.price) yen")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            if ramen.isSpicy {
                Image(systemName: "flame.fill")
                    .foregroundColor(.red)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
