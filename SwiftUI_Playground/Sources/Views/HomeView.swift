//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var agreedToTerms = false
    @State private var agreedText = ""

    var body: some View {
        Form {
            Section {
                Toggle("Agree to terms and conditions", isOn: $agreedToTerms)
            }

            Section {
                Button("Continue") {
                    agreedText = "Thank you"
                }
                .disabled(agreedToTerms == false)
            }
            Text(agreedText)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
