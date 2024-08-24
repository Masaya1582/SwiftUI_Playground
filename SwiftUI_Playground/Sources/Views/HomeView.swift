//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @StateObject var storeManager = StoreManager()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Premium Features")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                if storeManager.purchased {
                    Text("You have purchased the premium feature!")
                        .font(.headline)
                        .foregroundColor(.green)
                } else {
                    Text("Unlock premium features by purchasing.")
                        .font(.subheadline)
                        .padding(.horizontal, 20)

                    if !storeManager.products.isEmpty {
                        ForEach(storeManager.products, id: \.self) { product in
                            Button(action: {
                                storeManager.purchaseProduct(product)
                            }) {
                                Text("Buy \(product.localizedTitle) - \(product.priceLocale.currencySymbol ?? "$")\(product.price)")
                                    .font(.headline)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    } else {
                        Text("Loading products...")
                    }

                    Button(action: {
                        storeManager.restorePurchases()
                    }) {
                        Text("Restore Purchases")
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding()
            .navigationTitle("In-App Purchase")
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
