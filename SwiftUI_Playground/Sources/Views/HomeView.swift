//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var street: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var zipCode: String = ""

    var body: some View {
        VStack(spacing: 28) {
            AddressField(icon: "house", placeholder: "Street", text: $street)
            AddressField(icon: "house", placeholder: "City", text: $city)
            AddressField(icon: "house", placeholder: "State", text: $state)
            AddressField(icon: "house", placeholder: "Zip Code", text: $zipCode)
        }
        .padding()
    }
}

struct AddressField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .padding()

            TextField(placeholder, text: $text)
        }
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(Color.blue, lineWidth: 1)
        )
        .padding(.horizontal)
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
