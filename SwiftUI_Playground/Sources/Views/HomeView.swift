//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import LocalAuthentication

struct HomeView: View {
    @State private var isUnlocked = false

    var body: some View {
        VStack(spacing: 40) {
            if isUnlocked {
                Text("App Unlocked")
                    .font(.largeTitle)
                Image(systemName: "lock.open")
                    .resizable()
                    .frame(width: 100, height: 140)
            } else {
                Text("App Locked")
                    .font(.largeTitle)
                Image(systemName: "lock.fill")
                    .resizable()
                    .frame(width: 100, height: 140)
            }
        }
        .onAppear(perform: authenticate)
    }

    private func authenticate() {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    print("DEBUG_PRINT: Authentication Failed!")
                }
            }
        } else {
            print("DEBUG_PRINT: No Biometrics!")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
