//
//  StoreManager.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2024/08/24.
//

import SwiftUI
import StoreKit

final class StoreManager: NSObject, ObservableObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    @Published var products: [SKProduct] = []
    @Published var purchased = false

    private var productIDs = Set(["com.yourapp.premiumfeature"]) // Replace with your product ID

    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
        fetchProducts()
    }

    func fetchProducts() {
        let request = SKProductsRequest(productIdentifiers: productIDs)
        request.delegate = self
        request.start()
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async {
            self.products = response.products
        }
    }

    func purchaseProduct(_ product: SKProduct) {
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                // Handle successful purchase
                purchased = true
                SKPaymentQueue.default().finishTransaction(transaction)
            case .failed:
                // Handle failed transaction
                if let error = transaction.error as NSError?, error.code != SKError.paymentCancelled.rawValue {
                    print("Transaction Error: \(error.localizedDescription)")
                }
                SKPaymentQueue.default().finishTransaction(transaction)
            case .restored:
                purchased = true
                SKPaymentQueue.default().finishTransaction(transaction)
            default:
                break
            }
        }
    }

    func restorePurchases() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}

