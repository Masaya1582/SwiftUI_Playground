//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var cardNumber: String = ""
    @State private var cardHolderName: String = ""
    @State private var expirationDate: String = ""
    @State private var cvv: String = ""
    @State private var isCardNumberValid: Bool = false
    @State private var isCardHolderNameValid: Bool = false
    @State private var isExpirationDateValid: Bool = false
    @State private var isCVVValid: Bool = false

    var body: some View {
        VStack {
            Text("Payment Information")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
                .padding()

            TextField("Card Number", text: $cardNumber)
                .padding()
                .keyboardType(.numberPad)
                .onReceive(cardNumber.publisher.collect()) {
                    let text = String($0)
                    isCardNumberValid = text.count == 16
                }
                .background(isCardNumberValid ? Color.green.opacity(0.3) : Color.gray.opacity(0.3))
                .cornerRadius(10)
                .padding()

            TextField("Cardholder Name", text: $cardHolderName)
                .padding()
                .autocapitalization(.words)
                .onReceive(cardHolderName.publisher.collect()) {
                    isCardHolderNameValid = !$0.isEmpty
                }
                .background(isCardHolderNameValid ? Color.green.opacity(0.3) : Color.gray.opacity(0.3))
                .cornerRadius(10)
                .padding()

            HStack {
                TextField("Expiration Date (MM/YY)", text: $expirationDate)
                    .padding()
                    .keyboardType(.numberPad)
                    .onReceive(expirationDate.publisher.collect()) {
                        let text = String($0)
                        isExpirationDateValid = text.count == 5 && text.contains("/")
                    }
                    .background(isExpirationDateValid ? Color.green.opacity(0.3) : Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .padding()

                TextField("CVV", text: $cvv)
                    .padding()
                    .keyboardType(.numberPad)
                    .onReceive(cvv.publisher.collect()) {
                        let text = String($0)
                        isCVVValid = text.count == 3
                    }
                    .background(isCVVValid ? Color.green.opacity(0.3) : Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .padding()
            }

            Button {
                if isCardNumberValid && isCardHolderNameValid && isExpirationDateValid && isCVVValid {
                    // Payment is valid, proceed with processing
                    // You can navigate to a success screen or perform further actions here
                } else {
                    // Payment is not valid, show an error message
                }
            } label: {
                Text("Submit Payment")
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
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
