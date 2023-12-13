//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import LocalAuthentication

struct HomeView: View {
    @State private var passcode = ""
    @State private var isUnlocked = false
    @State private var isAuthenticationFailed = false

    var body: some View {
        VStack {
            if isUnlocked {
                Text("Access Granted!")
                    .modifier(CustomLabel(foregroundColor: .black, size: 24))
            } else {
                Text("Enter Passcode")
                    .modifier(CustomLabel(foregroundColor: .black, size: 20))
                SecureField("Passcode", text: $passcode)
                    .modifier(CustomTextField())
                Button("Authenticate") {
                    authenticateWithBiometrics()
                }
                .modifier(CustomButton(foregroundColor: .white, backgroundColor: .orange))
                .alert(isPresented: $isAuthenticationFailed) {
                    Alert(title: Text("Authentication Failed"), message: Text("Please Try Again"), dismissButton: .default(Text("OK")))
                }
            }
        }
    }

    private func authenticateWithBiometrics() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Authenticate to access the content"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        isUnlocked = true
                    } else {
                        isAuthenticationFailed = true
                    }
                }
            }
        } else {
            isAuthenticationFailed = true
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
