//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let analysts = ["Analyst1", "Analyst2", "Analyst3", "Analyst4", "Analyst5"]
    private let teslaStockPrice = 724.54
    private let priceChange = -5.32
    @State private var saveListing = false

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(analysts, id: \.self) { analyst in
                        Image("duck") // Placeholder for headshots
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                            .shadow(radius: 3)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)

            Divider()

            VStack(alignment: .leading) {
                Text("Tesla, Inc.")
                    .font(.title)
                    .bold()

                HStack {
                    Text("\(teslaStockPrice, specifier: "%.2f") USD")
                        .font(.title2)
                        .bold()

                    Spacer()

                    Image(systemName: priceChange >= 0 ? "arrow.up.right" : "arrow.down.right")
                        .foregroundColor(priceChange >= 0 ? .green : .red)

                    Text("\(priceChange >= 0 ? "+" : "")\(priceChange, specifier: "%.2f")")
                        .foregroundColor(priceChange >= 0 ? .green : .red)
                }
            }
            .padding()

            Text("Elon Musk is the CEO of Tesla, Inc., and is known for his work in revolutionizing the electric vehicle industry, as well as his involvement with SpaceX, Neuralink, and other innovative technology companies.")
                .padding()

            Text("Introductory call: $400/hour")
                .font(.headline)
                .padding()

            Toggle(isOn: $saveListing) {
                Text("Save this listing")
            }
            .padding()

            Spacer()

            Button(action: {
                // Action for booking the call
            }) {
                Text("Book now")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
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
